require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Panda Visas"
  end

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get visas" do
    get static_pages_visas_url
    assert_response :success
    assert_select "title", "Visas | #{@base_title}"
  end

  test "should get forms" do
    get static_pages_forms_url
    assert_response :success
    assert_select "title", "Forms | #{@base_title}"
  end

  test "should get community" do
    get static_pages_community_url
    assert_response :success
    assert_select "title", "Community | #{@base_title}"
  end

end
