module ApplicationHelper
  # 学習タイミングを確認するメソッド
  def unchecked_notifications
    study_records = StudyRecord.where(user_id: current_user.id, comprehension: false)
    study_records.each do |study_record|
      if study_record.review_count == 0
        return if study_record.study_timing[0][:first_timing] >= Time.zone.now
      elsif study_record.review_count == 1
        return if study_record.study_timing[0][:second_timing] >= Time.zone.now
      elsif study_record.review_count == 2
        return if study_record.study_timing[0][:third_timing] >= Time.zone.now
      elsif study_record.review_count == 3
        return if study_record.study_timing[0][:fourth_timing] >= Time.zone.now
      end
    end
  end
end
