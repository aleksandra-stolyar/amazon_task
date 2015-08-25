class OrdersController < ApplicationController
  def index

  end

  def new
    @cart = current_cart

    if @cart.order_items.empty?
      redirect to root_url, notice: "Your cart is empty."
      return
    end

    @order = Order.new
    render '/orders/new'
  end
end
