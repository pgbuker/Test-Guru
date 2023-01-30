class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.sort_categories(category)
    joins(:category).where(categories: {title: category}).order('tests.title DESC').pluck(:title)
  end
end


