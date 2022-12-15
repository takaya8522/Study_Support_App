require 'rails_helper'

RSpec.describe StudyRecord, type: :model do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:category) { FactoryBot.create(:category, user_id: admin_user.id) }
  describe 'バリデーションのテスト' do
    context '学習記録のタイトルが空文字の場合' do
      it 'バリデーションに失敗する' do
        study_record = StudyRecord.create(title: '', content: '単語帳を読む', category_id: category.id, user_id: admin_user.id)
        expect(study_record).not_to be_valid
      end
    end

    context '学習記録の説明が空文字の場合' do
      it 'バリデーションに成功する' do
        study_record = StudyRecord.create(title: '英語の勉強', content: '', category_id: category.id, user_id: admin_user.id)
        expect(study_record).to be_valid
      end
    end

    context '学習記録のタイトルと説明に値が入っている場合' do
      it '学習記録を登録できる' do
        study_record = StudyRecord.create(title: '英語の勉強', content: '単語帳を読む', category_id: category.id, user_id: admin_user.id)
        expect(study_record).to be_valid
      end
    end
  end
end
