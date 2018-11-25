require "test_helper"

class ApiPlacesControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get "/api/places"
        assert_response :success
    end
end