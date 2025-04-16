require "test_helper"

class MassageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get massage_index_url
    assert_response :success
  end

  test "should get show" do
    get massage_show_url
    assert_response :success
  end
end
