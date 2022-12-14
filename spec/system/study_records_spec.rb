require 'rails_helper'

RSpec.describe "学習記録管理機能", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:first_category) { FactoryBot.create(:first_category, user_id: @current_user.id) }
  let(:test_study_record) { FactoryBot.create(:study_record, user_id: @current_user.id, category_id: @category) }
  before do
    @current_user = User.find_by(email: "adminadmino@piyopiyo.com")
    @category = Category.find_by(name: "英語")
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'adminadmino@piyopiyo.com'
    fill_in 'パスワード', with: '123456'
    click_button 'ログイン'
  end

  describe '登録機能' do
    context '学習機能を登録した場合' do
      it '登録した学習記録が表示される' do
        visit new_user_study_record_path(@current_user)
        select '英語', from: 'カテゴリー名'
        fill_in 'タイトル', with: '単語の勉強'
        fill_in '内容', with: '単語帳を読む'
        click_button '登録する'
        expect(page).to have_content '英語の勉強'
      end
    end
  end

  describe '一覧表示機能' do
    let!(:first_study_record) { FactoryBot.create(:first_study_record, title: 'study_record_title1', user_id: @current_user.id, category_id: @category) }
    let!(:second_study_record) { FactoryBot.create(:second_study_record, title: 'study_record_title2', user_id: @current_user.id, category_id: @category) }
    let!(:third_study_record) { FactoryBot.create(:third_study_record, title: 'study_record_title3', user_id: @current_user.id, category_id: @category) }
    let(:fourth_study_record) { FactoryBot.create(:study_record, user_id: @current_user.id, category_id: @category) }
    before do
      visit user_study_records_path(@current_user)
    end

    context '一覧画面に遷移した場合' do
      it '作成済みの学習記録一覧が作成日時の降順で表示される' do
        study_record_list = all('body tr')
        expect(study_record_list[1].text).to have_content 'study_record_title1'
        expect(study_record_list[2].text).to have_content 'study_record_title2'
        expect(study_record_list[3].text).to have_content 'study_record_title3'
      end
    end

    context '新たにタスクを作成した場合' do
      it '新しいタスクが一番上に表示される' do
        study_record = test_study_record.merge(content: 'study_record_title4')
        visit user_study_records_path(@current_user)
        # allメソッドを使って複数のテストデータの並び順を確認する
        study_record_list = all('body tr')
        expect(study_record_list[1].text).to have_content 'study_record_title4'
      end
    end
  end

  describe '復習画面表示機能' do
    context '任意の学習記録の復習画面に遷移した場合' do
      it 'そのタスクの内容が表示される' do
        study_record = test_study_record.merge(content: 'study_record_title5')
        visit user_study_record_path(@current_user,study_record)
        expect(page).to have_content 'study_record_title5'
      end
    end
  end

  describe 'ソート機能' do
    let!(:first_study_record) { FactoryBot.create(:first_study_record, title: 'study_record_title1', user_id: @current_user.id, category_id: @category) }
    let!(:second_study_record) { FactoryBot.create(:second_study_record, title: 'study_record_title2', user_id: @current_user.id, category_id: @category) }
    let!(:third_study_record) { FactoryBot.create(:third_study_record, title: 'study_record_title3', user_id: @current_user.id, category_id: @category) }
    before do
      visit user_study_records_path(@current_user)
    end

    context '「カテゴリー」というリンクをクリックした場合' do
      it "カテゴリーごとに並び替えられた学習記録一覧が表示される" do
        click_link 'カテゴリー'
        study_record_list = all('body tr')
        expect(study_record_list[1].text).to have_content 'study_record_title1'
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
    let!(:first_study_record) { FactoryBot.create(:first_study_record, title: 'study_record_title1', user_id: @current_user.id, category_id: @category) }
    let!(:second_study_record) { FactoryBot.create(:second_study_record, title: 'study_record_title2', user_id: @current_user.id, category_id: @category) }
    let!(:third_study_record) { FactoryBot.create(:third_study_record, title: 'study_record_title3', user_id: @current_user.id, category_id: @category) }
    before do
      visit user_study_records_path(@current_user)
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
