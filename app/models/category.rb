class Category < ApplicationRecord
  belongs_to :user
  has_many :study_records, dependent: :destroy

  validates :name, presence: true
end
