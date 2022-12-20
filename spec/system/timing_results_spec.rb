require 'rails_helper'

RSpec.describe "学習結果管理機能", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:first_category) { FactoryBot.create(:category, user_id: admin_user.id) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
    fill_in 'パスワード', with: '123456'
    click_button 'ログイン'
  end

  describe '登録機能' do
    before do
      visit new_user_study_record_path(admin_user)
      select '英語', from: 'study_record[category_id]'
      fill_in 'タイトル', with: 'テスト'
      fill_in '内容', with: 'テスト'
      click_button '登録する'
      test = StudyRecord.find_by(title: 'テスト')

      visit user_study_record_path(admin_user, test)
    end

    context '学習結果を登録した場合' do
      it '復習画面に学習結果が表示される' do
        check 'study_record_first_record'
        click_button '復習登録'
        time = Time.zone.now.strftime("%Y-%m-%d %H:%M")
        expect(page).to have_content time
      end
    end
  end
end
