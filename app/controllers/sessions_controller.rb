class SessionsController < ApplicationController
  force_ssl
  
  def new
  end

  # This logs a user in
  # find the user in the DB by their email address
  # if user exists && authenticate by email => has_secure_password gives you this method
  # passwor will return T or F based on if it matched the digest in the DB
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Great job signing in"
    else
      flash.now.alert = "Your password or email was invalid...please try it again"
      render "new"
    end
  end

  # This logs a user out
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You successfully signed out" 
  end

end
