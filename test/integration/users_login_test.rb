require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    # Here users corresponds to the fixture filename users.yml , while the symbol
    # :michael references user with the key
    @user = users(:michael)
  end

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

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: "password" } }
    # to check the right redirect target
    assert_redirected_to @user
    # to actually visit the target page
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.email, password: "password" } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end