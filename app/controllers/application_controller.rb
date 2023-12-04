class ApplicationController < ActionController::Base
  # before_action :set_cart
  # before_action :authorize
  protect_from_forgery with: :exception
  helper_method :admin?
  helper_method :current_user
  helper_method :current_cart

  def admin?
    # Rails.logger.debug "Admin check: User is #{current_user&.admin ? 'an admin' : 'not an admin'}"
    current_user&.admin
  end


  def authenticate_admin!
    redirect_to(shopper_url, alert: 'Access Denied!') unless admin?
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # def current_cart
  #   Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   cart = Cart.create
  #   session[:cart_id] = cart.id
  #   cart
  # end
  #
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        return cart
      else
        # Cart ID was found in session but cart does not exist in database
        session[:cart_id] = nil
      end
    end

    if session[:cart_id].nil?
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end

end
