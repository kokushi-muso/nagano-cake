class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(1)  #params[:id]              
    @order_items = @order.order_items
  end
end
