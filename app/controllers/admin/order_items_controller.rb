class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      flash[:success] ="製作ステータスを変更しました"
      redirect_to admin_order_path(@order_item.order)
    else
      render "show"
    end


    private

    def order_item_params
      params.require(:order_item).permit(:product_status)
    end

  end
end
