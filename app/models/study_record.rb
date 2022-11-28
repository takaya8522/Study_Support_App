class StudyRecord < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :email
    validates :name
  end
end
