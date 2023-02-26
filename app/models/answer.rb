class Answer < ApplicationRecord
  LIMIT_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_limit_answers

  private

  def validate_limit_answers
    errors.add(:answers_quantity, 'Ответов не должно быть больше 4') if question.answers.count >= LIMIT_ANSWERS
  end
end
