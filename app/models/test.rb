class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :view_easy_level, -> { where(level: 0..1) }
  scope :view_medium_level, -> { where(level: 2..4) }
  scope :view_hard_level, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, lambda { |category|
                        joins(:category).where(categories: { title: category })
                      }
  scope :by_level, ->(level) { where(level: level) }

  scope :published_test, -> { where(publish: true) }

  scope :passed, -> { joins(:test_passages).merge(TestPassage.passed).distinct }

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'Может быть только один тест с таким названием и уровнем!' }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.sort_by_categories(category)
    view_categories(category).order('tests.title DESC').pluck(:title)
  end
end
