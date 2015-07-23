class OrderItem < ActiveRecord::Base
  validates :price, :quantity, presence: true

  belongs_to :book
  belongs_to :order

  def price
    price = book.price * quantity
  end
end
