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
end
