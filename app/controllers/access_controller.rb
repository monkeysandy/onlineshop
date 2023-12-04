class AccessController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def new
    if session[:user_id]
      redirect_to admin_url, notice: "Already logged in"
      return
    end
  end

  def create
    user = User.find_by(userid: params[:userid])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_orders_path, notice: "Logged in as Admin"
      else
        redirect_to shopper_url, notice: "Logged in"
      end
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to shopper_url, notice: "Logged out"
  end

end
