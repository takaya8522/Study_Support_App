class Category < ApplicationRecord
  has_many :study_record_categories, dependent: :destroy
  has_many :categories, through: :study_record_categories
  belongs_to :user

  validates :name, presence: true
end
