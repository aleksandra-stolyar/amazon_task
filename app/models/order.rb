class Order < ActiveRecord::Base
  enum status: { in_progress: 0, completed: 1, shipped: 2 }

  validates :total_price, :completed_date, :status, presence: true

  belongs_to :customer
  belongs_to :credit_card

  has_many   :order_items
  has_many   :addresses
  delegate   :shipping_address, :billing_address, to: :addresses

end
