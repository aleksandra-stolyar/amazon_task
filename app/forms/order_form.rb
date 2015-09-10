class OrderForm
  include ActiveModel::Model
  include Virtus.model

  attr_accessor :order
  attr_reader :current_user
  attr_writer :current_step
  attr_reader :current_cart
  attr_accessor :delivery_type_id
  attr_accessor :delivery_type
  attribute :delivery_type_id, Integer

  def initialize(order, session, cart)  
    @current_step = session[:order_step]
    @order = order
    @cart = cart

    assign_order_attributes(HashWithIndifferentAccess.new(session[:order_params]))
  end

  def shipping_address
    @order.shipping_address || (@order.user.shipping_address.nil? ?  @order.build_shipping_address : @order.user.shipping_address.dup)
  end

  def billing_address
    @order.billing_address || (@order.user.billing_address.nil? ?  @order.build_billing_address : @order.user.billing_address.dup)
  end

  def delivery_type
    @order.delivery_type_id
  end

  def credit_card
    @order.credit_card || (@order.user.credit_card.nil? ? @order.build_credit_card : @order.user.credit_card.dup)
  end

  def save
    add_order_items_from_cart
    @order.run
    @order.save if self.valid?
  end

  def add_order_items_from_cart
    @cart.order_items.each do |item|
      item.cart_id = nil
      @order.order_items << item
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

  private

  def assign_order_attributes(params)
    if params[:shipping_address]
      @order.build_shipping_address(params[:shipping_address])
      @order.build_billing_address(params[:billing_address])
    end

    if params[:delivery_type_id]
      @order.delivery_type_id = params[:delivery_type_id]
    end

    if params[:credit_card]
      @order.build_credit_card(params[:credit_card])
    end
  end
end