require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    # Visit the login path
    get login_path
    # verify that the login page is rendered using the correct view
    assert_template "sessions/new"
    # Post to the sessions path with an invalid params hash
    post login_path, params: { session: { email: "", password: "" } }
    # Verify that the new sessions form gets re-rendered
    assert_template "sessions/new"
    # Verify that a flash message appears
    assert_not flash.empty?
    # Visit another page
    get root_path
    # Verify that the flash message doesn’t appear on the new page
    assert flash.empty?
  end
end
