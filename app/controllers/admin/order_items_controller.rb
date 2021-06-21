class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find_by(order_id: params[:order_id], id: params[:id])
    imformation = @order_item.order
    @order_item.update(order_item_params)
      if params[:order_item][:product_status] == "製作中"
        imformation.update(order_status:2)
      end
      if imformation.order_items.all?{ |order_item| order_item.product_status == "製作完了"}
        imformation.update(order_status:4)
      end
      redirect_to admin_order_path(@order_item.order)
  end
  
  
  private

  def order_item_params
    params.require(:order_item).permit(:product_status)
  end

end
