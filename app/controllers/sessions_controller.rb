class SessionsController < ApplicationController

  # the session isn’t an Active Record model
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # remember(user) => app/helpers/sessions_helper.rb
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) 
      redirect_to user
      # same as: user_url(user)
    else
      # Create an error message.
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out if logged_in? # defined in app/helpers/sessions_helper.rb
    redirect_to root_url
  end
end
