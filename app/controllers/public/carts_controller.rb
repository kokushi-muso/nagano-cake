class Public::CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.item_id =
    @cart.save
    redirect_to carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to cart_path(@cart)
  end

  def price_including_tax
    @item.price_excluding_tax.to_i * 1.1
  end

  def total_price
    price_including_tax * @item.quantity
  end

  private
  def cart_params
    params.require(:cart).permit(:name, :price_including_tax, :quantity, :total_price)
  end
end