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
      it 'ログイン画面に遷移し、「ログインしてください」というメッセージが表示される' do
        visit user_path(1)
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end

  # describe 'ログイン機能' do
  #   let!(:admin_user) { FactoryBot.create(:admin_user) }
  #   let!(:normal_user) { FactoryBot.create(:normal_user) }
  #   before do
  #     visit new_session_path
  #     fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
  #     fill_in 'パスワード', with: '123456'
  #     click_button 'ログイン'
  #   end

  #   context '登録済みのユーザでログインした場合' do
  #     it 'タスク一覧画面に遷移し、「ログインしました」というメッセージが表示される' do
  #       expect(page).to have_content 'ログインしました'
  #     end

  #     it '自分の詳細画面にアクセスできる' do
  #       visit user_path(admin_user.id)
  #       expect(page).to have_content 'adminsさん'
  #     end

  #     it '他人の詳細画面にアクセスすると、タスク一覧画面に遷移する' do
  #       visit users_path(normal_user.id)
  #       expect(page).to have_content 'タスク一覧'
  #     end
      
  #     it 'ログアウトするとログイン画面に遷移し、「ログアウトしました」というメッセージが表示される' do
  #       find("#sign-out").click
  #       expect(page).to have_content 'ログアウトしました'
  #     end
  #   end
  # end

  # describe '管理者機能' do
  #   let!(:admin_user) { FactoryBot.create(:admin_user) }
  #   let!(:normal_user) { FactoryBot.create(:normal_user) }
  #   let!(:second_user) { FactoryBot.create(:second_user) }

  #   context '管理者がログインした場合' do
  #     before do
  #       visit new_session_path
  #       fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
  #       fill_in 'パスワード', with: '123456'
  #       click_button 'ログイン'
  #     end

  #     it 'ユーザ一覧画面にアクセスできる' do
  #       find("#users-index").click
  #       expect(page).to have_content 'ユーザ一覧ページ'
  #     end

  #     it '管理者を登録できる' do
  #       find("#new-user").click
  #       expect(page).to have_content 'ユーザ登録ページ'
  #     end

  #     it 'ユーザ詳細画面にアクセスできる' do
  #       find("#users-index").click
  #       click_link '詳細', match: :first
  #       expect(page).to have_content 'アカウント詳細ページ'
  #     end

  #     it 'ユーザ編集画面から、自分以外のユーザを編集できる' do
  #       find("#users-index").click
  #       click_link '編集', match: :first
  #       expect(page).to have_content 'ユーザ編集ページ'
  #     end

  #     it 'ユーザを削除できる' do
  #       find("#users-index").click
  #       click_link '削除', match: :first
  #       expect{
  #         expect(page.accept_confirm).to eq "本当に削除してもよろしいですか？"
  #         expect(page).to have_content "ユーザを削除しました"
  #         }
  #     end
  #   end

  #   context '一般ユーザがユーザ一覧画面にアクセスした場合' do
  #     let!(:first_user) { FactoryBot.create(:first_user) }
  #     before do
  #       visit new_session_path
  #       fill_in 'メールアドレス', with: 'normalnormal@piyopiyo.com'
  #       fill_in 'パスワード', with: '123456'
  #       click_button 'ログイン'
  #     end

  #     it 'タスク一覧画面に遷移し、「管理者以外アクセスできません」というエラーメッセージが表示される' do
  #       visit admin_users_path
  #       expect(page).to have_content '管理者以外はアクセスできません'
  #     end
  #   end
  # end
end