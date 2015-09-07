class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :find_current_cart

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to main_app.root_url
  end  

  private

  def find_current_cart
    @current_cart ||= Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end

end

