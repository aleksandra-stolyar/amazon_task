class CartsController < ApplicationController
  def destroy
    @current_cart.destroy!
    session[:cart_id] = nil
    flash[:alert] = "Your cart is empty!"
    redirect_to root_url 
  end

  def show
    if @current_cart.order_items.empty?
      flash[:alert] = "No products yet."
      redirect_to root_url
    end
  end
end
