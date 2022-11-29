class StudyRecord < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :study_cycle
    validates :user_id
  end
end
