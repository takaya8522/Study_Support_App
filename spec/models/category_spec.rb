require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:admin_user) { FactoryBot.create(:admin_user) }

  describe 'バリデーションのテスト' do
    context 'カテゴリーの名前が空文字の場合' do
      it 'バリデーションに失敗する' do
        category = Category.create(name: "", user_id: admin_user.id)
        expect(category).not_to be_valid
      end
    end

    context 'カテゴリーの名前に値があった場合' do
      it 'バリデーションに成功する' do
        category = Category.create(name: "aaa", user_id: admin_user.id)
        expect(category).to be_valid
      end
    end
  end
end
