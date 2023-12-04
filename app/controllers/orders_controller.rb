class OrdersController < ApplicationController
  include(CurrentCart)
  before_action :set_cart
  before_action :set_order, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!, only: [:new, :create, :update, :destroy]



  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @lineitems = @order.lineitems.includes(:product)

  end

  # GET /orders/new
  def new
    if @cart.lineitems.empty?
      redirect_to(shopper_url, notic: "Your cart is empty.")


      return
    end
    @order = Order.new

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  # def create
  #   # add order_id to lineitems

  #   @order = Order.new(order_params)
  #   @order.user = current_user


  #   @order.add_order_id_in_lineitems(@cart)

  #   respond_to do |format|
  #     if @order.save
  #       Cart.destroy(session[:cart_id])
  #       session[:cart_id] = nil
  #       format.html { redirect_to shopper_url, notice: "Order was successfully created." }
  #       format.json { render :show, status: :created, location: @order }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @order = Order.new(order_params)
    # @order.user = current_user  # Set the user for the order

    if current_user
      @order.user = current_user
      if @order.save
        transfer_line_items_from_cart(@order)

        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        respond_to do |format|
          format.html { redirect_to shopper_url, notice: "Order was successfully created." }
          format.json { render :show, status: :created, location: @order }
        end
      else
        respond_to do |format|
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_url, notice: "Please log in to place an order."
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :paytype)
    end

    def transfer_line_items_from_cart(order)
      @cart = current_cart
      current_cart.lineitems.each do |item|
        # Rails.logger.info("item: #{item.inspect}")
        item.update(order_id: order.id, cart_id: nil)
      end
    end

    def authenticate_user
      redirect_to login_url, notice: "Please log in" unless current_user
    end

end
