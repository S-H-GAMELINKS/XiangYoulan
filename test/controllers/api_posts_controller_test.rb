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
        post "/api/posts", params: {post: {title: "test", content: "test"}}
        assert_response :success
    end

    test "should post create using hashtag" do
        post "/api/posts", params: {post: {title: "test", content: "test", tags: "#tags #example"}}
        assert_response :success
    end

    test "should null post can't create" do
        post "/api/posts", params: {post: {title: "", content: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end

    test "should post update" do
        put "/api/posts/1", params: {post: {title: "test", content: "test"}}
        assert_response :success
    end

    test "should post update using hashtag" do
        put "/api/posts", params: {post: {title: "test", content: "test", tags: "#tags #example"}}
        assert_response :success
    end

    test "should null post can't update" do
        put "/api/posts/1", params: {post: {title: "", content: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end

    test "should post delete" do
        delete "/api/posts/1"
        assert_response :success
    end

    test "should post search" do
        post "/api/posts/search", params: {q: {content_cont: "test"}}
        assert_response :success
    end

    test "should post pagenation" do
        post "/api/posts/pagenation", params: {page: 1}
        assert_response :success
    end
end