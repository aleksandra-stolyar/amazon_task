class Order < ActiveRecord::Base
  enum status: { in_progress: 0, completed: 1, shipped: 2 }

  validates :total_price, :completed_date, :status, presence: true

  belongs_to :user
  belongs_to :credit_card

  has_many   :order_items

  has_one :billing_address
  has_one :shipping_address

  def count_total_price
    order_items.inject(0) { |sum,item| sum += item.price * item.quantity }
  end

  


end
