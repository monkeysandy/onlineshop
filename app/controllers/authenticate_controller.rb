class AuthenticateController < ApplicationController

  def login
    if session[:user_id]
      redirect_to shopper_url, notice: "Already logged in"
    else
      redirect_to login_url
    end
  end

  def checkpassword
    user = User.find_by(userid: params[:userid])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to shopper_url, notice: "Logged in"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to shopper_url, notice: "Logged out"
  end
end
