class AdminController < ApplicationController
  include CurrentCart
  before_action :set_cart

  before_action :authenticate_admin!
  def index
    @total_orders = Order.count
    @orders = Order.all.order('created_at DESC')
  end

  private

  def authenticate_admin!
    redirect_to root_path unless current_user&.admin?
  end
end
