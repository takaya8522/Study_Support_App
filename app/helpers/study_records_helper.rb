module StudyRecordsHelper
  # 残り何時間か返すメソッド
  # 例 (111111.11秒 * 1分/60秒 * 1時間/60分 % 24時間 = 6.864...時間).round = 7時間
  def divide_hour(diff_time)
    (diff_time / 3600 % 24).round
  end

  # 残り何分か返すメソッド
  # 例 (222222.22秒 * 1分/60秒 * 1時間/60分 % 1時間 * 60分/時間 = 51.85...分).round = 52分
  def divide_minute(diff_time)
    (diff_time / 3600 % 1 * 60).round
  end

  # review_countによってstudy_timingを算出するメソソッド
  def set_timing(review_count, study_timing)
    if review_count == 0
      return study_timing.first_timing
    elsif review_count == 1
      return study_timing.second_timing
    elsif review_count == 2
      return study_timing.third_timing
    elsif review_count == 3
      return study_timing.fourth_timing
    end
  end

  # chartkick用の設定値を算出するメソッド
  def set_forgetting_curve(study_record)
    study_record_time = set_starting_time(study_record)
    forgetting_curve = []
    # 投稿時刻の1分前を記憶率0%として挿入
    forgetting_curve.push([study_record_time.ago(1.minute), 0])
    # 投稿時刻を記憶率100%として挿入
    forgetting_curve.push([study_record_time, 100])
    # 投稿時刻から20分後、1時間後、9時間後、1日後、2日後、6日後、1ヶ月後の記憶率を挿入
    forgetting_curve.push([study_record_time.since(20.minutes), 58.2])
    forgetting_curve.push([study_record_time.since(1.hour), 44.2])
    forgetting_curve.push([study_record_time.since(9.hours), 35.8])
    forgetting_curve.push([study_record_time.since(1.day), 33.8])
    forgetting_curve.push([study_record_time.since(2.days), 27.2])
    forgetting_curve.push([study_record_time.since(6.days), 25.2])
    forgetting_curve.push([study_record_time.since(1.month), 21.2])
    # 送る値は日付だけにする
    forgetting_curve.map { |k, v| [k.strftime('%m/%d %H:%M'), v] }
  end

  private

  def set_starting_time(study_record)
    # グラフの開始時刻日をレビューカウントごとに算出するメソッド
    case study_record.review_count
    when 0
      study_record.created_at
    when 1
      study_record.timing_result[0][:first_record]
    when 2
      study_record.timing_result[0][:second_record]
    when 3
      study_record.timing_result[0][:third_record]
    else
      return
    end
  end
end
