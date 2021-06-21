class Admin::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @items = Item.all.page(params[:page]).per(4)
    # ページネーション
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # 詳細画面へ遷移
      flash[:notice] = "商品の登録に成功しました"
      redirect_to admin_item_path(@item.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genre
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      # 詳細画面へ遷移
      flash[:notice] = "商品の編集に成功しました"
      redirect_to admin_item_path(@item.id)
    else
      redirect_back(fallback_location: root_path)

    end     
  end

  private
  def item_params
    params.require(:item).permit(:name,:image,:introduction,:price_excluding_tax,:is_active,:genre_id)
  end

end
