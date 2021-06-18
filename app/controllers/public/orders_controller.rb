class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @carts = current_customer.carts
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    # @order = current_customer.carts
    # @order.save
    redirect_to thanks_new_order_path
  end

  private
  def order_params
    params.require(:order).permit(:postcode, :address, :recieve_name, :order_id, :customer_id, :shipping_fee, :payment_method, :total_price, :order_status)
  end
end
