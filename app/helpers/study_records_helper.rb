module StudyRecordsHelper
  # 残り何時間か返すメソッド
  # 例 (111111.11秒 * 1分/60秒 * 1時間/60分 % 24時間 = 6.864...時間).round = 7時間
  def divide(diff_time)
    (diff_time / 3600 % 24).round
  end

  # 残り何分か返すメソッド
  # 例 (222222.22秒 * 1分/60秒 * 1時間/60分 % 1時間 * 60分/時間 = 51.85...分).round = 52分
  def divide_minute(diff_time)
    (diff_time / 3600 % 1 * 60).round
  end
end
