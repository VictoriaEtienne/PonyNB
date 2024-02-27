require "test_helper"

class PoniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ponies_index_url
    assert_response :success
  end

  test "should get show" do
    get ponies_show_url
    assert_response :success
  end

  test "should get new" do
    get ponies_new_url
    assert_response :success
  end

  test "should get create" do
    get ponies_create_url
    assert_response :success
  end
end
