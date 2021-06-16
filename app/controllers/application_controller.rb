class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  private
  
  #==========ログイン後の遷移先を指定===============
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_orders_path
    else
      root_path
    end
  end
  
  #==========ログアウト後の遷移先を指定=============
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    end
  end
  
  #=====customerのストロングパラメーター============
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :email,
      :postcode,
      :address,
      :phone_number,
      :is_valid
    ])
  end

end
