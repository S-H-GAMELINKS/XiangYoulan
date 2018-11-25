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

    test "should get new" do
        get "/api/places/new"
        assert_response :success
    end

    test "should get edit" do
        get "/api/places/1/edit"
        assert_response :success
    end

    test "should place create" do
        post "/api/places", params: {post: {title: "test", content: "test"}}
        assert_response :success
    end

    test "should null place can't create" do
        post "/api/places", params: {post: {title: "", content: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end
end