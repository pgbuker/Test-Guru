class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, presence: true

  RULES = %i[success_category success_on_first_try success_all_level].freeze
end
