require 'rails_helper'

RSpec.describe "学習記録管理機能", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:first_category) { FactoryBot.create(:category, user_id: admin_user.id) }
  let!(:first_study_record) { FactoryBot.create(:first_study_record, title: 'study_record_title1', user_id: admin_user.id, category_id: first_category.id) }
  let!(:second_study_record) { FactoryBot.create(:second_study_record, title: 'study_record_title2', user_id: admin_user.id, category_id: first_category.id) }
  let!(:third_study_record) { FactoryBot.create(:third_study_record, title: 'study_record_title3', user_id: admin_user.id, category_id: first_category.id) }
  let!(:first_study_timing) { FactoryBot.create(:study_timing, study_record_id: first_study_record.id) }
  let!(:second_study_timing) { FactoryBot.create(:study_timing, study_record_id: second_study_record.id) }
  let!(:third_study_timing) { FactoryBot.create(:study_timing, study_record_id: third_study_record.id) }
  let!(:timing_result) { FactoryBot.create(:timing_result, study_record_id: first_study_record.id) }
  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
    fill_in 'パスワード', with: '123456'
    click_button 'ログイン'
  end
  describe '登録機能' do
    context '学習機能を登録した場合' do
      it '登録した学習記録が表示される' do
        visit new_user_study_record_path(admin_user)
        select '英語', from: 'study_record[category_id]'
        fill_in 'タイトル', with: '単語の勉強'
        fill_in '内容', with: '単語帳を読む'
        click_button '登録する'
        expect(page).to have_content '単語の勉強'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの学習記録一覧が作成日時の昇順で表示される' do
        visit user_study_records_path(admin_user)
        study_record_list = all('body tr')
        # allメソッドを使って複数のテストデータの並び順を確認する        
        expect(study_record_list[1].text).to have_content 'study_record_title3'
        expect(study_record_list[2].text).to have_content 'study_record_title2'
        expect(study_record_list[3].text).to have_content 'study_record_title1'
      end
    end

    context '新たに学習記録を作成した場合' do
      let!(:fourth_study_record) { FactoryBot.create(:fourth_study_record, title: 'study_record_title4', user_id: admin_user.id, category_id: first_category.id) }
      let!(:fourth_study_timing) { FactoryBot.create(:study_timing, study_record_id: fourth_study_record.id) }
      it '新しいタスクが一番上に表示される' do
        visit user_study_records_path(admin_user)
        study_record_list = all('body tr')
        expect(study_record_list[1].text).to have_content 'study_record_title4'
      end
    end
  end

  describe '復習画面表示機能' do
    context '任意の学習記録の復習画面に遷移した場合' do
      it 'そのタスクの内容が表示される' do
        visit user_study_record_path(admin_user,first_study_record)
        expect(page).to have_content 'study_record_title1'
      end
    end
  end

  describe 'ソート機能' do
    before do
      visit user_study_records_path(admin_user)
    end

    context '「カテゴリー」というリンクをクリックした場合' do
      it "カテゴリーごとに並び替えられた学習記録一覧が表示される" do
        click_link 'カテゴリー'
        study_record_list = all('body tr')
        expect(study_record_list[1].text).to have_content 'study_record_title3'
      end
    end
    context '「タイトル」というリンクをクリックした場合' do
      it "カテゴリーごとに並び替えられた学習記録一覧が表示される" do
        click_link 'タイトル'
        study_record_list = all('body tr')
        expect(study_record_list[1].text).to have_content 'study_record_title1'
      end
    end
  end

  describe '検索機能' do
    before do
      visit user_study_records_path(admin_user)
    end

    context 'タイトルであいまい検索をした場合' do
      it "検索ワードを含むタスクのみ表示される" do
        # toとnot_toのマッチャを使って表示されるものとされないものの両方を確認する
        fill_in 'キーワード', with: 'title1'
        click_button '検索'
        expect(page).to have_content 'study_record_title1'
        expect(page).not_to have_content 'study_record_title2'
        expect(page).not_to have_content 'study_record_title3'
      end
    end
  end
end
