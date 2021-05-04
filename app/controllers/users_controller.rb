class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    puts ">>>>>>>>>>>>>>>>>>>>>>>"
    puts params[:user] # hash of user attributes
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # equivalent: redirect_to user_url(@user)
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  # The update_attributes method accepts a hash of attributes, and on success
  # performs both the update and the save in one step (returning true to indicate
  # that the save went through).
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def user_params
    # we require the params hash to have a :user attribute, and we want
    # to permit the name, email, password, and password confirmation attributes
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end

# $ rails generate controller Users new
