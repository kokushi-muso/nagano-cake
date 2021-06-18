class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order_items = Ordes.item.all
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

end
