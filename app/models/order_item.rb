class OrderItem < ActiveRecord::Base
  validates :price, :quantity, presence: true

  belongs_to :book
  belongs_to :cart
  belongs_to :order

  def price
    quantity * book.price
  end

end
