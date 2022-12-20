require 'rails_helper'

RSpec.describe "Categories", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
    fill_in 'パスワード', with: '123456'
    click_button 'ログイン'
  end

  describe '登録機能' do
    context 'カテゴリーを登録した場合' do
      it '登録したカテゴリーが表示される' do
        visit user_categories_path(admin_user)
        fill_in 'category[name]', with: 'カテゴリー'
        click_button '追加'
        expect(page).to have_content 'カテゴリー'
      end
    end
  end

  describe '一覧表示機能' do
    let!(:first_category) { FactoryBot.create(:category, user_id: admin_user.id) }

    context '一覧画面に遷移した場合' do
      it '登録済みのカテゴリー一覧が表示される' do
        visit user_categories_path(admin_user)
        expect(page).to have_content '英語'
      end
    end
  end
end
