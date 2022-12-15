require 'rails_helper'

RSpec.describe StudyTiming, type: :model do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:first_category) { FactoryBot.create(:category, user_id: admin_user.id) }
  let!(:first_study_record) { FactoryBot.create(:first_study_record, user_id: admin_user.id, category_id: first_category.id) }

  describe 'バリデーションのテスト' do
    context '学習記録のidが無い場合' do
      it 'バリデーションに失敗する' do
        study_timing = StudyTiming.create(study_record_id: "")
        expect(study_timing).not_to be_valid
      end
    end

    context '学習記録のidが有る場合' do
      it 'バリデーションに成功する' do
        study_timing = StudyTiming.create(study_record_id: first_study_record.id)
        expect(study_timing).to be_valid
      end
    end
  end
end
