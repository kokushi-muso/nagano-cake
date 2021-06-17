class Public::ItemsController < ApplicationController
  def index
    #レイアウトの際に、個数を調整する
    @items = Item.page(params[:page]).per(1)
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def price_including_tax
    price_excluding_tax.to_i * 1.1
  end
end
