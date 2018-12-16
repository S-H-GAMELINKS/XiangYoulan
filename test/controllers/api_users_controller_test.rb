require "test_helper"

class ApiUsersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
        @user = users( :dummy )
        sign_in(@user)
    end

    test "should get activity feed" do
        post "/api/users/feed"
        assert_response :success
    end
end