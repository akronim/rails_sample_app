require "test_helper"

#class UsersControllerTest < ActionController::TestCase
class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get new" do
    #get :new # nok
    #get signup_path # ok
    get "/signup"
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    #get :edit, params: { id: @user }
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    #patch :update, params: { id: @user, user: { name: @user.name, email: @user.email } }
    patch user_path(@user), params: { user: { name: @user.name,
                                             email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    #get :edit, params: { id: @user }
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    #patch :update, params: { id: @user, user: { name: @user.name, email: @user.email } }
    patch user_path(@user), params: { user: { name: @user.name,
                                         email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
