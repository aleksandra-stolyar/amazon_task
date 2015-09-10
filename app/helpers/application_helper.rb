module ApplicationHelper
  def current_cart
    @current_cart
  end

  #-------------for new order--------------
  def count_order_items_price
    @current_cart.total_price
  end

  def count_shipping_price
    @order.delivery_type.price
    # binding.pry
    # DeliveryType.find_by_id(session[:order_params]["delivery_type_id"]).price

  end

  def count_order_total_price
    count_order_items_price + count_shipping_price
  end
  
end
