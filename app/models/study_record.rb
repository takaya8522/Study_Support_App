class StudyRecord < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :study_timing, dependent: :destroy
  has_many :timing_result, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :study_cycle
    validates :user_id
    validates :review_count
    validates :comprehension
  end

  # # 復習回数を0回〜4回に固定する
  # validates :review_count, numericality: { only_integer: true, greater_than: -1, less_than: 5 }
  # # 理解度をtrueかfalseに固定する
  # validates :comprehension, inclusion: { in: [true, false] }

  # enum学習サイクル・理解度用
  enum study_cycle: { 忘却曲線: 0, 一週間: 1, 一ヶ月: 2 }
  enum comprehension: { まだ理解していません: false, 理解しました: true }
end
