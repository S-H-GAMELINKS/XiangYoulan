require "test_helper"

class ApiPlacesControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get "/api/places"
        assert_response :success
    end
    
    test "should get show" do
        get "/api/places/1"
        assert_response :success
    end
end