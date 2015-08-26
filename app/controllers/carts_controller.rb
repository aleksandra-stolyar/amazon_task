class CartsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart.destroy!
    session[:cart_id] = nil
    flash[:alert] = "Your cart is empty!"
    redirect_to root_url 
  end

  def show
    @cart = current_cart
    if @cart.order_items.empty?
      flash[:alert] = "No products yet."
      redirect_to root_url
    end
  end
end
