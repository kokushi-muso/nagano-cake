class Public::CartsController < ApplicationController
  
  def index
    @carts = current_customer.carts
    @total_price = (total_price * TAX).to_i
  end

  def create
    unless quantity = params[:cart][:quantity].nil?
      if @cart = current_customer.carts.find_by(item_id: params[:cart][:item_id])
        @cart.quantity += params[:cart][:quantity].to_i
      else
        @cart = Cart.new
        @cart.quantity = params[:cart][:quantity]
        @cart.item_id = params[:cart][:item_id]
        @cart.customer_id = current_customer.id
      end
    end
    
    if @cart.save
      flash[:notice] = "カートに商品を追加しました"
      redirect_to carts_path
    else
      flash[:alert] = "カートに商品を追加できませんんでした"
      @item = Item.find(params[:cart][:item_id])
      @cart = @cart
      render 'public/items/show'
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to carts_path
  end

  def price_including_tax
    @item.price_excluding_tax.to_i * TAX
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
  
  def cart_params
    params.require(:cart).permit(:quantity, :customer_id, :item_id)
  end
  
end