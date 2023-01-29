class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  # has_and_belongs_to_many :users
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.sort_categories(category)
    joins('JOIN categories ON categories.id = tests.category_id').where(categories: { title: category }).order('tests.title DESC').pluck(:title)
  end
end
