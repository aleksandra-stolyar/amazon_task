class ShopCart
  def initialize(session)
    @session = session
    @session[:shop_cart] ||= {}
  end

  def add(item_id, quantity = 1)
    @session[:shop_cart][item_id] = quantity
  end

  def items
    @session[:shop_cart]
  end
end