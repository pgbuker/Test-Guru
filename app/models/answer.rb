class Answer < ApplicationRecord
  LIMIT_ANSWERS = 4

  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_limit_answers

  private

  def validate_answers_limit
    errors.add(:answers_quantity, 'Ответов не должно быть больше 4') if question.answers.count >= LIMIT_ANSWERS
  end
end
