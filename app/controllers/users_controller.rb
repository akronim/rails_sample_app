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

  private

  def user_params
    # we require the params hash to have a :user attribute, and we want 
    # to permit the name, email, password, and password confirmation attributes
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end

# $ rails generate controller Users new
