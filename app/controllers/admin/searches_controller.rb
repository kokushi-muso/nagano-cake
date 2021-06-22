class Admin::SearchesController < ApplicationController

  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @model, @value)
  end
  
  private
# 完全一致
  def match(model, value)
    if model == 'customer'
      Customer.where(last_name: value)
    elsif model == 'item'
      Item.where(name: value)
    end
  end

# 前方一致
  def forward(model, value)
    if model == 'Customer'
      Customer.where("last_name LIKE ?", "#{value}%")
    elsif model == 'item'
      Item.where("name LIKE ?", "#{value}%")
    end
  end

# 後方一致
  def backward(model, value)
    if model == 'customer'
      Customer.where("first_name LIKE ?", "%#{value}")
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{value}")
    end
  end

# 部分一致
  def partical(model, value)
    if model == 'customer'
      Customer.where("last_name LIKE ?", "%#{value}%")
    elsif model == 'item'
      Item.where("name LIKE ?", "%#{value}%")
    end
  end
  
  def search_for(how, model, value)
    case how
      when 'match'
        match(model, value)
      when 'forward'
        forward(model, value)
      when 'backward'
        backward(model, value)
      when 'partical'
        partical(model, value)
    end
  end  
end
