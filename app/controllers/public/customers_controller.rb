class Public::CustomersController < ApplicationController
  
  def mypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      flash[:notice] = '会員情報を編集しました'
      redirect_to customers_mypage_path
    else
      @customer = customer
      render :edit
    end
  end
  
  
    private
    
    def customer_params
      params.require(:customer).permit(
        :first_name,
        :last_name,
        :first_name_kana,
        :last_name_kana,
        :postcode,
        :address,
        :email,
        :phone_number
        )
    end
end
