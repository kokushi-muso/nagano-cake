class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @carts = current_customer.carts
    @total_price = total_price
    unless @order.valid?
      @order = current_customer.orders.new(order_params)
      @customer = current_customer
      flash[:notice] = "正しく入力してください"
      render :new
    end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = current_customer.orders.new
    order.shipping_fee = params[:order][:shipping_fee]
    order.payment_method = params[:order][:payment_method]
    order.recieve_name = params[:order][:recieve_name]
    order.postcode = params[:order][:postcode]
    order.address = params[:order][:address]
    order.order_status = :入金待ち
    order.total_price = total_price * TAX
    order.save
    
    @order_id = order.attributes['id']
    carts = current_customer.carts
    carts.each do |cart|
      order_item = OrderItem.new
      order_item.item_id = cart.item.id
      order_item.quantity = cart.quantity
      order_item.price_including_tax = cart.item.price_excluding_tax * cart.quantity * TAX
      order_item.order_id = @order_id
      order_item.save
    end
    current_customer.carts.destroy_all
    redirect_to thanks_new_order_path
  end
  
  TAX = 1.1

  def total_price
    @carts = current_customer.carts
    sum = 0
    @carts.each do |cart|
      n = cart.item.price_excluding_tax * cart.quantity
      sum += n
    end
    return sum
  end

  private
  def order_params
    params.require(:order).permit(
      :postcode,
      :address,
      :recieve_name,
      :order_id,
      :customer_id,
      :shipping_fee,
      :payment_method,
      :total_price,
      :order_status
      )
  end
end
