class OrderController < ApplicationController
  def index
    @order_items = @order.order_items

  end
end
