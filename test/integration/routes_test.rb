require "test_helper"

class RoutesTest < ActionDispatch::IntegrationTest
  test "should get /" do
    get "/"
    assert_response :success
  end

  test "should get /about" do
    get "/about"
    assert_response :success
  end

  test "should get /contact" do
    get "/contact"
    assert_response :success
  end

  test "should get /posts" do
    get "/posts"
    assert_response :success
  end

  test "should get /posts/1" do
    get "/posts/1"
    assert_response :success
  end
end
