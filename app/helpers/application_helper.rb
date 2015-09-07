module ApplicationHelper
  def current_cart
    @current_cart
  end

  #-------------for order--------------
  def count_order_items_price
    @current_cart.total_price
  end

  def count_shipping_price
    @order.delivery_type.price
  end

  def count_order_total_price
    count_order_items_price + count_shipping_price
  end
  
end
