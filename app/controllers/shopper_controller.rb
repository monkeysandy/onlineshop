class ShopperController < ApplicationController
  include CurrentCart
  before_action :set_cart


  def index
    if current_user&.admin?
      @orders = Order.order('created_at DESC')
    elsif current_user
      @orders = current_user.orders.order('created_at DESC')
    end
    @allproducts = Product.order(:name)
  end
end
