class Order < ActiveRecord::Base
  include AASM

  enum status: { in_progress: 0, in_queue:1, in_delivery: 2, delivered: 3, canceled: 4 }

  validates :total_price, :completed_date, :status, presence: true

  belongs_to :user
  belongs_to :credit_card
  has_many :delivery_types

  has_many   :order_items

  has_one :billing_address, class_name: "Address", as: :addressable
  has_one :shipping_address, class_name: "Address", as: :addressable
  
  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address, reject_if: :use_billing_address 

  def add_order_items_from_cart(cart)
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end
  end

  aasm :column => :status, :enum => true do
    state :in_progress, :initial => true
    state :in_queue
    state :in_delivery
    state :delivered
    state :canceled

    event :run do
      transitions :from => :in_progress, :to => :in_queue
    end

    event :start_deliver do
      transitions :from => :in_queue, :to => :in_delivery
    end

    event :complete_deliver do
      transitions :from => :in_delivery, :to => :delivered
    end

    event :cancel do
      transitions :from => [:in_progress, :in_queue, :in_delivery], :to => :canceled
    end
  end
  
end
