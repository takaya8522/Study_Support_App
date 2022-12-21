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

  # enum学習サイクル・理解度用
  enum study_cycle: { 忘却曲線: 0, 一週間: 1, 一ヶ月: 2 }
  enum comprehension: { まだ理解していません: false, 理解しました: true }

  # 投稿の中で未復習でかつ最短の通知時間の投稿を振り分けるメソッド
  def self.latest_study_record(study_records)
    # 最新の復習回数を判断して配列に入れる
    yet_review = []
    study_records.each do |study_record|
      yet_review.push({ timing: study_record.study_timing[0][:fourth_timing], timing_num: 4, post_id: study_record.id, category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      next if study_record.review_count == 3
      yet_review.push({ timing: study_record.study_timing[0][:third_timing], timing_num: 3, post_id: study_record.id, category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      next if study_record.review_count == 2
      yet_review.push({ timing: study_record.study_timing[0][:second_timing], timing_num: 2, post_id: study_record.id, category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      next if study_record.review_count == 1
      yet_review.push({ timing: study_record.study_timing[0][:first_timing], timing_num: 1, post_id: study_record.id, category_name: study_record.category.name, title: study_record.title, content: study_record.content })
    end
    # 学習タイミング順にソートする
    order_timings = yet_review.sort_by! { |a| a[:timing] }
    # post_idを持った配列を作成
    study_timing_array = order_timings.map do |order_timing|
      [order_timing[:post_id], order_timing[:timing_num], order_timing[:timing], order_timing[:category_name], order_timing[:title], order_timing[:content]]
    end
    # order_timingsの配列をカテゴリーごとに並べて変数化
    category_group = order_timings.group_by { |x| x[:category_name] }
    # カテゴリーのtypeの入った配列を作成する
    category_array = category_group.map do |category_hash|
      category_hash.first
    end
    # 日付順で並び替えた学習タイミングと、カテゴリーの配列を引数として返す。
    [study_timing_array, category_array]
  end
end
