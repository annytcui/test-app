require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get visas" do
    get static_pages_visas_url
    assert_response :success
  end

  test "should get forms" do
    get static_pages_forms_url
    assert_response :success
  end

  test "should get community" do
    get static_pages_community_url
    assert_response :success
  end

end
