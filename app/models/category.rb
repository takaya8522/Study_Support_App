class Category < ApplicationRecord
  belongs_to :user
  has_many :study_records

  validates :name, presence: true
end
