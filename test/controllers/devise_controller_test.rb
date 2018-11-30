require "test_helper"

class DeviseControllerTest < ActionDispatch::IntegrationTest
  test "should sign up user" do
    post "/users", params: { user: { email: "test@hoge.com", password: "testhogehoge", password_confirmation: "testhogehoge" }}
    assert_equal true, User.first.email == "test@hoge.com"
  end
end