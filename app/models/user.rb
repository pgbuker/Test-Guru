class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  def passed_tests(level)
    tests.where(level: level)
  end
end
