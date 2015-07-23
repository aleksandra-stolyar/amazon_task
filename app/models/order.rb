class Order < ActiveRecord::Base
  enum status: { in_progress: 0, completed: 1, shipped: 2 }

  validates :total_price, :completed_date, :status, presence: true

  belongs_to :customer
  belongs_to :credit_card

  has_many   :order_items

  has_one :billing_address
  has_one :shipping_address

  def total_price
    order_items.inject(0) { |sum,item| sum += item.price * item.quantity }
  end

  def build_from_cart( cart )
    cart.items.each do |item_id, quantity|

    end
  end
end


# o = Order.new
# o.build_from_cart( @shop_cart )
# o.save!
# @shop_cart.empty!