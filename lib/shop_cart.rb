class ShopCart
  def initialize(session)
    @session = session
    @session[:shop_cart] ||= {}
    # @session[:shop_cart] = {} unless @session[:shop_cart].kind_of?(Hash)  
  end

  def add(id, quantity = 1)
    @session[:shop_cart][id] = quantity
  end

  def items
    @session[:shop_cart]
  end

  def build_order
    order = customer.orders.build
    items.to_a.each do |order_item|
      order_item.first.each do |key, value|
        order.order_items << OrderItem.create do |oi|
          oi.book_id = order_item.first.values_at(:id)[0]
          oi.price = Book.find_by(id: oi.book_id).price
          oi.quantity = order_item.first.values_at(:quantity)[0]
        end
      end
    end
    order.total_price = order.count_total_price
    order.completed_date = DateTime.now
  end

end