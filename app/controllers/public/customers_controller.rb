class Public::CustomersController < ApplicationController
  
  def mypage
    @customer = current_customer
  end

  def edit
  end

  def update
  end
end
