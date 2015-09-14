class Order < ActiveRecord::Base
  include AASM

  enum status: { in_progress: 0, in_queue:1, in_delivery: 2, delivered: 3, canceled: 4 }

  belongs_to  :user
  belongs_to  :delivery_type
  has_many    :order_items
  has_one     :credit_card
  has_one     :billing_address,  as: :addressable
  has_one     :shipping_address, as: :addressable

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

  def item_price
    order_items.to_a.sum {|item| item.price}
  end

  def delivery_price
    delivery_type.price
  end

  def total_price
    item_price + delivery_price
  end

end
