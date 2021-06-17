class Public::CartsController < ApplicationController
  def index
  end

  def total_price
    @order_items.price_including_tax.to_i * quantity
  end
end
