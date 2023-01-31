class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  scope :easy_level, -> { where(level: 0..1).order(title: :asc) }
  scope :medium_level, -> { where(level: 2..4).order(title: :asc) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY).order(title: :asc) }

  scope :sort_by_categories, lambda { |category|
                               joins(:category).where(categories: { title: category }).order('tests.title DESC').pluck(:title)
                             }
  scope :sort_by_level, ->(level) { where(level: level) }

  def self.sort_categories(category)
    joins(:category).where(categories: { title: category }).order('tests.title DESC').pluck(:title)
  end
end
