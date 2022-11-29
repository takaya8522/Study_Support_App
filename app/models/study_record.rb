class StudyRecord < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :learning_cycle
    validates :user_id
  end
end
