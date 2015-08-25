class CartsController < ApplicationController
  def destroy
    @cart = current_cart
    @cart.destroy!
    session[:cart_id] = nil
    redirect_to root_url, notice: "Your cart is empty!"
  end

  def show
    @cart = current_cart
  end
end
