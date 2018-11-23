require "test_helper"

class WebControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "shoud get index status" do
    get root_url
    assert_equal 200, response.status
  end

  test "should include index content <nav-bar></nav-bar>" do
    get root_url
    assert_equal true, response.body.include?("<nav-bar></nav-bar>")
  end

  test "should include index content <router-view></router-view>" do
    get root_url
    assert_equal true, response.body.include?("<router-view></router-view>")
  end
end
