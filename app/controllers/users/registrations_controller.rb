class Users::RegistrationsController < Devise::RegistrationsController 
  before_filter :check_permissions, except: [ :new, :create ] 
  before_filter :configure_permitted_parameters
  skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :create, resource
  end 

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation,
      :credit_card_attributes => [:number, :cvv, :expiration_month, :expiration_year,
                                  :first_name, :last_name],
      :billing_address_attributes => [:first_name, :last_name, :address, :zip_code, :city, :phone, :country],
      :shipping_address_attributes => [:first_name, :last_name, :address, :zip_code, :city, :phone, :country])
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password,
      :password_confirmation, :first_name, :last_name,
      :credit_card_attributes => [:number, :cvv, :expiration_month, :expiration_year,
                                  :first_name, :last_name],
      :billing_address_attributes => [:first_name, :last_name, :address, :zip_code, :city, :phone, :country],
      :shipping_address_attributes => [:first_name, :last_name, :address, :zip_code, :city, :phone, :country])
    }
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_root_path(resource)
  end
end