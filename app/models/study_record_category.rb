class StudyRecordCategory < ApplicationRecord
  belongs_to :study_record
  belongs_to :category
end
