class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
     # ページネーション
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      # 詳細画面へ遷移
      redirect_to admin_customer_path(@customer.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:email,:create_at,:first_name,:last_name,:first_name_kana,:last_name_kana,:postcode,:address,:phone_number,:is_valid)
  end

end