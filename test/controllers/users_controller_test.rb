require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anny)
    @other_user = users(:mark)
  end


  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { gender: :male } }
    assert_redirected_to root_path
  end

  test "should redirect update when logged in as a wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { firstname: @user.firstname, lastname: @user.lastname } }
    assert_redirected_to root_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: { user: {
              password: "password123",
              password_confirmation: "password123",
              admin: true } }
    assert_not @other_user.reload.admin?
  end
end
