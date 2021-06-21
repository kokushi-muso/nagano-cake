class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    imformations = @order.order_items
    if params[:order][:order_status] == "入金確認"
      imformations.each do |imformation|
          imformation.update(product_status:1)
      end
    end
    if @order.update(order_params)
      flash[:success] = "注文ステータスを変更しました"
      redirect_to admin_order_path(@order)
    else
      render "show"
    end
  end


  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
