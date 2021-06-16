class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # ページネーション
  end

  def new
    @item = Item.new
    # @genre = @item.genre
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
      redirect_to admin_item_path(@item.id)
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(item.id)
    else
      redirect_back(fallback_location: root_path)
    end     
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:image,:introduction,:price_excluding_tax,:is_active,:genre_id)
  end
  
end
