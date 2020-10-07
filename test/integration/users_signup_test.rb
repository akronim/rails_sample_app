require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    # a comparison between User.count before and after
    assert_no_difference "User.count" do
      # issue a POST request to the users_path
      post users_path, params: { user: { name: "",
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end
    # check that a failed submission re-renders the new action
    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
    assert_select "ul > li"
  end

  test "valid signup information" do
    get signup_path
    # + the size of the difference
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name: "Example User",
                                        email: "user@example.com",
                                        password: "password",

                                        password_confirmation: "password" } }
      # redirect after submission
      follow_redirect!
    end
    assert_template "users/show"
    assert_not flash.nil?
  end
end
