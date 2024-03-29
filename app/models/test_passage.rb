class TestPassage < ApplicationRecord
  PASSING_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_save_set_next_question

  def completed?
    current_question.nil? || time_out?
  end

  scope :passed, -> { where('result >= 85') }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.result = percent_correct
    save!
  end

  def success?
    percent_correct >= PASSING_SCORE
  end

  def percent_correct
    (correct_questions * 100 / test.questions.count).to_i
  end

  def progress_percent
    (question_number.to_f / test.questions.count.to_f * 100).round(1)
   end

  def question_number
    test.questions.index(current_question) + 1
  end

  def time_left(test_passage)
    test_passage.test.time_limit.to_i * 60 - (Time.now - test_passage.created_at).to_i if test_passage.test.time_limit > 0
  end

  def time_out?
    (test.timer - (Time.now - created_at)).to_i <= 0
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_save_set_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
