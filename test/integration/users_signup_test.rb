require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get root_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { firstname: "",
                      lastname: "", email: "user@invalid",
                      password: "foo",
                      password_confirmation: "barbar" } }
    end
    assert_template 'static_pages/home'
    assert_select 'div.invalid-feedback', count: 5
  end

  test "valid signup information" do
    get root_path
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: { firstname: "Example",
                    lastname: "User", email: "user@example.com",
                    password: "password123",
                    password_confirmation: "password123" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
