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

  # enum理解度用
  enum comprehension: { まだ理解していません: false, 理解しました: true }

  # 投稿の中で未復習でかつ最短の通知時間の投稿を振り分けるメソッド
  def self.latest_study_record(study_records)
    # 最新の復習回数を判断して配列に入れる
    yet_review = []
    study_records.each do |study_record|
      yet_review.push({ study_timing: study_record.study_timing[0][:fourth_timing], review_count: 4, study_record_id: study_record.id,
                        category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      next if study_record.review_count == 3

      yet_review.push({ study_timing: study_record.study_timing[0][:third_timing], review_count: 3, study_record_id: study_record.id,
                        category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      next if study_record.review_count == 2

      yet_review.push({ study_timing: study_record.study_timing[0][:second_timing], review_count: 2, study_record_id: study_record.id,
                        category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      next if study_record.review_count == 1

      yet_review.push({ study_timing: study_record.study_timing[0][:first_timing], review_count: 1, study_record_id: study_record.id,
                        category_name: study_record.category.name, title: study_record.title, content: study_record.content })
    end
    # 学習タイミング順にソートする
    sorted_timings = yet_review.sort_by { |a| a[:study_timing] }
    # ハッシュの値のみを取得し、配列にする。
    study_timing_array = sorted_timings.map(&:values)
    # sorted_timingsの配列をカテゴリーごとにグループ化し、キーのみを配列にする。
    category_array = sorted_timings.group_by { |b| b[:category_name] }.keys
    # 日付順で並び替えた学習タイミングと、カテゴリーの配列を引数として返す。
    [study_timing_array, category_array]
  end
end
