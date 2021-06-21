class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      flash[:notice] = "配送先住所を追加しました。"
      redirect_to addresses_path(current_customer)
    else
      @address = address
      @addresses = current_customer.addresses
      flash[:alert] = "正しく入力してください。"
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    addresses = current_customer.addresses
    address = addresses.find(params[:id])
    if address.update(address_params)
      flash[:notice] = '配送先住所の内容を変更しました。'
      redirect_to addresses_path
    else
      @address = address
      flash[:alert] = "正しく入力して下さい。"
      render :edit
    end
  end
  
  def destroy
    addresses = current_customer.addresses
    address = addresses.find(params[:id])
    address.destroy
    flash[:notice] = "1件の配送先住所を削除しました。"
    redirect_to addresses_path
  end
  
    private
    
    def address_params
      params.require(:address).permit(:postcode, :address, :recieve_name)
    end
    
end
