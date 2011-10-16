class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate
    unless current_user
      redirect_to sign_in_path, :notice => "Please sign in first"
      return false
    end
  end
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
