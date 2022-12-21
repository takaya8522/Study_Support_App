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
  def self.latest_study_record(study_records, _user_id)
    # 直近の未復習が何ターム目を判断し配列に入れる
    yet_review = []
    study_records.each do |study_record|
      # 投稿の復習カウントが0回なら予定復習投稿を全部配列に追加
      if study_record.review_count.zero?
        yet_review.push({ timing: study_record.study_timing[0][:first_timing], timing_num: 1, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
        yet_review.push({ timing: study_record.study_timing[0][:second_timing], timing_num: 2, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
        yet_review.push({ timing: study_record.study_timing[0][:third_timing], timing_num: 3, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
        yet_review.push({ timing: study_record.study_timing[0][:fourth_timing], timing_num: 4, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      # 投稿の復習カウントが1回なら2~4の復習を配列に追加
      elsif study_record.review_count == 1
        yet_review.push({ timing: study_record.study_timing[0][:second_timing], timing_num: 2, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
        yet_review.push({ timing: study_record.study_timing[0][:third_timing], timing_num: 3, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
        yet_review.push({ timing: study_record.study_timing[0][:fourth_timing], timing_num: 4, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      # 投稿の復習カウントが2回なら3,4の復習を配列に追加
      elsif study_record.review_count == 2
        yet_review.push({ timing: study_record.study_timing[0][:third_timing], timing_num: 3, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
        yet_review.push({ timing: study_record.study_timing[0][:fourth_timing], timing_num: 4, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      # 投稿の復習カウントが3回なら4のみ復習を配列に追加
      elsif study_record.review_count == 3
        yet_review.push({ timing: study_record.study_timing[0][:fourth_timing], timing_num: 4, post_id: study_record.id,
                           category_name: study_record.category.name, title: study_record.title, content: study_record.content })
      end
    end
    # 投稿の未復習の通知タイミング順にソートした配列
    order_timings = yet_review.sort_by! { |a| a[:timing] }
    study_record_array = []
    # post_idを持った配列を作成
    order_timings.each do |order_timing|
      study_record_array.push([order_timing[:post_id], order_timing[:timing_num], order_timing[:timing],
                       order_timing[:category_name], order_timing[:title], order_timing[:content]])
    end
    # order_timingsの配列をジャンルごとに並べて変数化
    # {{genre_id:[投稿の集合]},{genre_id:[投稿の集合],・・・}のようになっている
    category_group = order_timings.group_by { |x| x[:category_name] }
    # ここでまとめて最短の投稿を持つジャンルごとにソートした配列も用意する
    category_array = []
    # each文でジャンルのtypeの入った配列を作成
    category_group.each do |category_hash|
      category_array.push(category_hash.first)
    end
    # 通知の早いもの順でソートされている投稿の集合とジャンルの集合を配列化して返す
    # post_arrayは[[post_id,first_term,timing,category_name,title,content],[]...]の形で送る。
    # genre_arrayは["name","name",...]の形で送る
    [study_record_array, category_array]
  end
end
