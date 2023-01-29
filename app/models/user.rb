class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def passed_tests(level)
    Test.joins('JOIN passed_tests ON tests.id = passed_tests.test_id').where(
      'passed_tests.user_id = ? AND tests.level = ?', id, level
    )
  end
end
