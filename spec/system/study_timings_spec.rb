require 'rails_helper'

RSpec.describe "学習タイミング登録機能", type: :system do
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
    end

    context '学習機能を登録した場合' do
      it '復習画面に学習タイミングが表示される' do
        test = StudyRecord.find_by(title: 'テスト')
        time = 1.day.from_now.strftime("%Y-%m-%d %H:%M")
        visit user_study_record_path(admin_user, test)
        expect(page).to have_content time
      end
    end
  end
end
