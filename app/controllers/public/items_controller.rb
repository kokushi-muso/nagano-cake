class Public::ItemsController < ApplicationController

  def index
    #per()で1ページに入れたい数を変更する
    @items = Item.page(params[:page]).per(8)
    #商品の数をすべて数える場合用（1ページに表示される数を出す場合は下の行を消す
    @items_count = Item.all
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