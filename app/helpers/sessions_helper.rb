module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    # - the temporary cookie created by the session
    # method expires immediately when the browser is closed
    # - temporary cookies created using the session method are
    # automatically encrypted
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    # signed cookie securely encrypts the cookie before placing it on the browser
    cookies.permanent.signed[:user_id] = user.id
    # cookies.permanent[:remember_token] = user.remember_token
    cookies[:remember_token] = { value: user.remember_token,
                                 expires: 20.years.from_now.utc }
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    # if current_user is not nil
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
