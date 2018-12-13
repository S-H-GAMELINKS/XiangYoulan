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

  test "should get /places/1/posts/1" do
    get "/places/1/posts/1"
    assert_response :success
  end

  test "should get /places/1/posts/1/edit" do
    get "/places/1/posts/1/edit"
    assert_response :success
  end

  test "should get /places/1/posts/new" do
    get "/places/1/posts/new"
    assert_response :success
  end

  test "should get /search" do
    get "/search/:id"
    assert_response :success
  end

  test "should get /places" do
    get "/places"
    assert_response :success
  end

  test "should get /places/1" do
    get "/places/1"
    assert_response :success
  end

  test "should get /places/1/edit" do
    get "/places/1/edit"
    assert_response :success
  end

  test "should get /places/new" do
    get "/places/new"
    assert_response :success
  end

  test "should get /hashtags/:id" do
    get "/hashtags/test"
    assert_response :success
  end

  test "should get /sign_up" do
    get "/sign_up"
    assert_response :success
  end

  test "should get /sign_in" do
    get "/sign_in"
    assert_response :success
  end

  test "should get /users/:id" do
    get "/users/1"
    assert_response :success
  end

  test "should get /users/mypages" do
    get "/users/mypages"
    assert_response :success
  end

  test "should get /users/mypages/edit" do
    get "/users/mypages/edit"
    assert_response :success
  end
end
