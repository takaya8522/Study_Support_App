class StudyRecord < ApplicationRecord
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :study_cycle
    validates :user_id
  end

  # enum学習サイクル・理解度用
  enum study_cycle: { 忘却曲線: 0, 一週間: 1, 一ヶ月: 2 }
  enum comprehension: { まだ理解していません: false, 理解しました: true }
end
