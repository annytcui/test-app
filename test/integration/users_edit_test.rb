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

  test "successful edit" do
    get user_path(@user)
    assert_template 'users/show'
    firstname = "Anny"
    lastname = "Cui Pan"
    gender = :female
    patch user_path(@user), params: { user: { firstname: firstname, lastname: lastname, gender: gender, birthday: { year: "2017" } } }
    @user.reload
    assert_equal firstname, @user.firstname
    assert_equal gender, @user.gender
  end
end
