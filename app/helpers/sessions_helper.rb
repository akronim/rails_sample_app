module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    # - the temporary cookie created by the session
    # method expires immediately when the browser is closed
    # - temporary cookies created using the session method are 
    # automatically encrypted
    session[:user_id] = user.id
  end
end
