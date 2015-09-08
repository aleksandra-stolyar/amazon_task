class Order < ActiveRecord::Base
  include AASM

  enum status: { in_progress: 0, in_queue:1, in_delivery: 2, delivered: 3, canceled: 4 }
  enum step: { address: 0, delivery:1, payment: 2, confirmation: 3 }

  belongs_to  :user
  belongs_to  :delivery_type
  has_many    :order_items
  has_one     :credit_card
  has_one     :billing_address,  as: :addressable
  has_one     :shipping_address, as: :addressable
  
  accepts_nested_attributes_for :shipping_address
  accepts_nested_attributes_for :billing_address
  accepts_nested_attributes_for :credit_card
  accepts_nested_attributes_for :delivery_type

  attr_writer :current_step

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

  def add_order_items_from_cart(cart)
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end
  end

  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[address delivery payment confirmation]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step
    steps.first
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

end
