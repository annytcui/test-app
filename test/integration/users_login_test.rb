require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anny)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_select 'div.alert'
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { email: @user.email,
                              password: 'password' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "form[action=?]", login_path, count: 0
    assert_select "form[action=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "form[action=?]", login_path
    assert_select "form[action=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
