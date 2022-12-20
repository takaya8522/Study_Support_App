require 'rails_helper'

RSpec.describe "ユーザー管理機能", type: :system do
  describe '登録機能' do
    context 'ユーザを登録した場合' do
      it '学習記録一覧画面に遷移する' do
        visit new_user_registration_path
        fill_in '名前', with: 'テストさん'
        fill_in 'メールアドレス', with: 'testsan@testsan.com'
        fill_in 'パスワード', with: '123456'
        fill_in '確認用パスワード', with: '123456'
        click_button 'アカウント登録'
        expect(page).to have_content '学習記録一覧'
      end
    end
    context 'ログインせずにタスク一覧画面に遷移した場合' do
      it 'ログイン画面に遷移し、「ログインしてください」というメッセージが表示される', js: true do
        visit user_path(1)
        sleep 1
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end

  describe 'ログイン機能' do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:normal_user) { FactoryBot.create(:normal_user) }
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
      fill_in 'パスワード', with: '123456'
      click_button 'ログイン'
    end

    context '登録済みのユーザでログインした場合' do
      it 'タスク一覧画面に遷移し、「ログインしました」というメッセージが表示される', js: true do
        expect(page).to have_content 'ログインしました'
      end

      it '自分の詳細画面にアクセスできる', js: true do
        visit user_path(admin_user)
        expect(page).to have_content 'admins'
      end

      it '他人の詳細画面にアクセスすると、「他のユーザーページにはアクセスできません」というメッセージが表示される', js: true do
        visit user_path(normal_user)
        expect(page).to have_content '他のユーザーページにはアクセスできません'
      end
      
      it 'ログアウトするとログイン画面に遷移し、「ログアウトしました」というメッセージが表示される', js: true do
        click_on 'サインアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe '管理者機能' do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    let!(:normal_user) { FactoryBot.create(:normal_user) }

    context '管理者がログインした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
        fill_in 'パスワード', with: '123456'
        click_button 'ログイン'
        visit user_path(admin_user)
      end

      it '管理者用ページにアクセスできる' do
        find("#admin_page").click
        expect(page).to have_content 'admins'
      end

      it 'ユーザを削除できる', js: true do
        find("#admin_page").click
        click_on '削除する', match: :first
        expect{
          expect(page.accept_confirm).to eq "本当に削除してもよろしいですか？"
          expect(page).to have_content "ユーザを削除しました"
          }
      end
    end

    context '一般ユーザがユーザ一覧画面にアクセスした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'normalnormal@piyopiyo.com'
        fill_in 'パスワード', with: '123456'
        click_button 'ログイン'
      end

      it '学習記録一覧画面に遷移させる。' do
        visit admin_users_path
        expect(page).to have_content '学習記録一覧'
      end
    end
  end
end