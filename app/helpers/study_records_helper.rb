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

  # 現在時刻が通知時間よりも後の場合にtrueを返すメソッド
  # def check_timing_bool(study_timing, review_count, current_time)
  #   if review_count.zero?
  #     return true if study_timing.first_timing <= current_time
  #   elsif review_count == 1
  #     return true if study_timing.second_timing <= current_time
  #   elsif review_count == 2
  #     return true if study_timing.third_timing <= current_time
  #   elsif review_count == 3
  #     return true if study_timing.forth_timing <= current_time
  #   else
  #     false
  #   end
  #   false
  # end
end
