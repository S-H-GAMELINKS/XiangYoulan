require 'test_helper'

class WebControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_index_url
    assert_response :success
  end

  test "shoud get index status" do
    get web_index_url
    assert_equal 200, response.status
  end

end
