module ApplicationHelper
  # 学習タイミングを確認するメソッド
  def check_notifications
    study_records = StudyRecord.where(user_id: current_user.id, comprehension: false)
    study_records.each do |study_record|
      if study_record.review_count == 0 && (study_record.study_timing[0][:first_timing] - Time.zone.now) / 86_400 < 0
        return true
      elsif study_record.review_count == 1 && (study_record.study_timing[0][:second_timing] - Time.zone.now) / 86_400 < 0
        return true
      elsif study_record.review_count == 2 && (study_record.study_timing[0][:third_timing] - Time.zone.now) / 86_400 < 0
        return true
      elsif study_record.review_count == 3 && (study_record.study_timing[0][:fourth_timing] - Time.zone.now) / 86_400 < 0
        return true
      end
    end
    false
  end
end
