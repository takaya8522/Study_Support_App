require "test_helper"

class StudyRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get study_records_index_url
    assert_response :success
  end

  test "should get edit" do
    get study_records_edit_url
    assert_response :success
  end

  test "should get new" do
    get study_records_new_url
    assert_response :success
  end

  test "should get show" do
    get study_records_show_url
    assert_response :success
  end
end
