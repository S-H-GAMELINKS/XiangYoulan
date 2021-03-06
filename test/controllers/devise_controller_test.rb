require "test_helper"

class DeviseControllerTest < ActionDispatch::IntegrationTest
  test "should sign up user" do
    post "/users", params: { user: { name: "S.H.", about: "test", email: "test@hoge.com", password: "testhogehoge", password_confirmation: "testhogehoge" }}
    assert_equal true, User.last.email == "test@hoge.com"
  end

  test "should sign in user" do
    post "/users", params: { user: { name: "S.H.", about: "test", email: "test@hoge.com", password: "testhogehoge", password_confirmation: "testhogehoge" }}
    post "/users/sign_in", params: { user: { email: "test@hoge.com", password: "testhogehoge" }}
    assert_response :redirect
  end

  test "should sign out user" do
    post "/users", params: { user: { name: "S.H.", about: "test", email: "test@hoge.com", password: "testhogehoge", password_confirmation: "testhogehoge" }}
    post "/users/sign_in", params: { user: { email: "test@hoge.com", password: "testhogehoge" }}
    delete "/users/sign_out"
    assert_response :redirect
  end

  test "should update user info" do
    post "/users", params: { user: { name: "S.H.", about: "test", email: "test@hoge.com", password: "testhogehoge", password_confirmation: "testhogehoge" }}
    post "/users/sign_in", params: { user: { email: "test@hoge.com", password: "testhogehoge" }}
    put "/api/users", params: { id: User.first.id, user: { name: "SH", about: "testtest", email: "test@hogehoge.com", password: "testhogehoge", password_confirmation: "testhogehoge" }}
    assert_equal true,  User.first.email == "test@hogehoge.com"
    assert_equal true, User.first.name == "SH"
    assert_equal true, User.first.about == "testtest"
  end
end