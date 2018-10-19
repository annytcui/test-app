require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anny)
  end

  test "unsuccessful edits" do
    get user_path(@user)
    assert_template 'users/show'
    patch user_path(@user), params: { user: { firstname: "",
          lastname: "", gender: "female",
          birthday: "" } }
    assert_template 'users/show'
  end
end
