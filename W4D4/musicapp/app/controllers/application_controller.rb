class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !session[:session_token].nil?
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
end
