class Public::AddressesController < ApplicationController
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to addresses_path(current_customer)
    else
      @address = address
      @addresses = current_customer.addresses
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
      flash[:notice] = 'アドレスの変更が完了しました'
      redirect_to addresses_path
    else
      @address = address
      render :edit
    end
  end
  
  def destroy
    addresses = current_customer.addresses
    address = addresses.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end
  
    private
    
    def address_params
      params.require(:address).permit(:postcode, :address, :recieve_name)
    end
    
end
