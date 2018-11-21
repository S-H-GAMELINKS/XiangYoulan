require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get "/api/posts"
        assert_response :success
    end

    test "should get show" do
        get "/api/posts/1"
        assert_response :success
    end    
end