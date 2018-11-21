require 'test_helper'

class WebControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_index_url
    assert_response :success
  end

  test "shoud get index status" do
    get web_index_url
    assert_equal 200, response.status
  end

  test "should include index content {{mes}}" do
    get web_index_url
    assert_equal true, response.body.include?('{{mes}}')
  end

  test "should include index content <nav-bar></nav-bar>" do
    get web_index_url
    assert_equal true, response.body.include?('<nav-bar></nav-bar>')
  end

  test "should include index content <router-link></router-link>" do
    get web_index_url
    assert_equal true, response.body.include?('<router-link></router-link>')
  end

  test "should include index content <router-view></router-view>" do
    get web_index_url
    assert_equal true, response.body.include?('<router-view></router-view>')
  end
end
