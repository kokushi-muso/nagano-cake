class Admin::SearchesController < ApplicationController

  def search
    redirect_to root_path if params[:value] == ""
    
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model, @value)
  end
  
  private

  def search_for(model, value)
    if model == 'customer'
      Customer.where("last_name LIKE ? OR first_name LIKE ? or last_name || first_name LIKE ?", "%#{value}%","%#{value}%","%#{value}%")
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{value}%")
    end
  end
  
end
