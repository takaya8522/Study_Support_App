class TimingResult < ApplicationRecord
  belongs_to :study_record

  # 受け取った値がどの復習タイミングか判別するメソッド
  def self.check(received_record)
    # 復習番目と復習予定時間の配列を用意
    timings = [:first_record, :second_record, :third_record, :fourth_record]
    timings.each do |timing|
      next unless received_record[timing] == 'true'

      # 配列化
      array_timing = [timing, Time.zone.now]
      # ハッシュ化
      hash_timing = Hash[*array_timing]
      return hash_timing
    end
    false
  end
end
