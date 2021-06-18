class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])  #params[:id]
    @order_items = @order.order_items
    @shipping_fee = 800
  end
end
