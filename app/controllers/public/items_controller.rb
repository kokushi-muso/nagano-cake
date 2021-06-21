class Public::ItemsController < ApplicationController
  
  def index
    #レイアウトの際に、個数を調整する
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price_excluding_tax)
  end
end