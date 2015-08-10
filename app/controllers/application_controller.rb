class ApplicationController < ActionController::Base
  # include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :load_shop_cart

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    # binding.pry
    redirect_to main_app.root_url
  end  

  def load_shop_cart
    @shop_cart = ShopCart.new(session) #[:shop_cart]
  end

  # -----------------------------------------------------
  # in ApplicationHelper
  # -----------------------------------------------------
  
  # def current_ability
  #   if admin_signed_in?
  #     @current_ability ||= Ability.new(current_admin)
  #   else
  #     @current_ability ||= Ability.new(current_user)
  #   end
  # end

end
