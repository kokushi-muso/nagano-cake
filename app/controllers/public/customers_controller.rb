class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def mypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      flash[:notice] = '会員情報の変更を保存しました。'
      redirect_to customers_mypage_path
    else
      @customer = customer
      flash[:alert] = "正しく入力してください。"
      render :edit
    end
  end
  
  def unsubcribe
  end
  
  def withdraw
    customer = current_customer
    customer.update(is_valid: false)
    reset_session
    flash[:notice] = 'ありがとうございます。またのご利用をお待ちしております。'
    redirect_to root_path
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
