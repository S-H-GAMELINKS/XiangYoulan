require "test_helper"

class ApiPlacesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
        @user = users( :dummy )
        sign_in(@user)
    end

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
        post "/api/places", params: {place: {name: "test", content: "test", tags: ""}}
        assert_response :success
    end

    test "should place create using hastag" do
        post "/api/places", params: {place: {name: "test", content: "test", tags: "#tags #example"}}
        assert_response :success
    end

    test "should null place can't create" do
        post "/api/places", params: {place: {name: "", content: "", tags: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end

    test "should place update" do
        put "/api/places/1", params: {place: {name: "test", content: "test", tags: ""}}
        assert_response :success
    end

    test "should place update using hastag" do
        put "/api/places/1", params: {place: {name: "test", content: "test", tags: "#tags #example"}}
        assert_response :success
    end

    test "should null place can't update" do
        put "/api/places/1", params: {place: {name: "", content: "", tags: ""}}
        assert_equal true, response.body.include?("can't be blank")
    end

    test "should place delete" do
        delete "/api/places/1"
        assert_response :success
    end

    test "should place search" do
        post "/api/places/search", params: {q: {content_cont: "test"}}
        assert_response :success
    end

    test "should place pagenation" do
        post "/api/places/pagenation", params: {page: 1}
        assert_response :success
    end

    test "should place hashtag" do
        post "/api/places/hashtags", params: {id: 1}
        assert_response :success
    end

    test "should place hashtag search" do
        post "/api/places/search/hashtags", params: {tag: "#test"}
        assert_response :success
    end
    
    test "should place lng & lat get" do
        post "/api/places/location", params: { name: "Paris" }
        assert_response :success
    end

    test "should place follow" do
        post "/api/places/follow", params: {id: 1}
        assert_response :success
    end

    test "should place unfollow" do
        post "/api/places/follow", params: {id: 1}
        assert_response :success
    end

    test "should place is followed?" do
        post "/api/places/followed", params: {id: 1}
        assert_response :success
    end

    test "should post now place info" do
        post "/api/places/now", params: {lat: 35.47576255, lng: 133.050605829669}
        assert_response :success
    end

    test "should place count" do
        get "/api/places/count"
        assert_response :success
    end
end