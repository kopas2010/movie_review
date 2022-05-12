require "test_helper"

class User::ReviewersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_reviewers_new_url
    assert_response :success
  end

  test "should get index" do
    get user_reviewers_index_url
    assert_response :success
  end

  test "should get show" do
    get user_reviewers_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_reviewers_edit_url
    assert_response :success
  end
end
