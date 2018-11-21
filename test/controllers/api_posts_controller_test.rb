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
    
    test "should get new" do
        get "/api/posts/new"
        assert_response :success
    end

    test "should get edit" do
        get "/api/posts/1/edit"
        assert_response :success
    end

    test "should post create" do
        post "/api/posts", :posts => {title: "test", content: "test"}
        assert_response :success
    end

    test "should post update" do
        put "/api/posts/1", :posts => {title: "test", content: "test"}
        assert_response :success
    end
end