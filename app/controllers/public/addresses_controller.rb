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
  end
  
    private
    
    def address_params
      params.require(:address).permit(:postcode, :address, :recieve_name)
    end
    
end
