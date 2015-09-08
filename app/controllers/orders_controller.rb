class OrdersController < ApplicationController
  load_and_authorize_resource :through => :current_user

  before_filter :setup_order, only: [:new, :steps, :finish]
  before_filter :check_cart, only: :new
  before_filter :set_session, only: [:steps, :finish]


  def index
  end

  def show
  end

  def new
    session[:order_params] ||= {}
    session[:order_step] = @order.first_step
    render '/orders/new'
  end

  def steps
    if @order.valid?
      if params[:back_button]
        @order.previous_step        
      else  
        @order.next_step
      end
      render 'new'
      session[:order_step] = @order.current_step
    end
  end

  def finish
    raise "Can't submit form!" unless @order.last_step?

    if @order.valid?
      @order.add_order_items_from_cart(@current_cart)
      @order.save if @order.all_valid?
      session[:order_step] = session[:order_params] = nil
      flash[:notice] = "Order saved."
      redirect_to @order
    else
      render 'new'
    end
  end

  def check_cart
    if @current_cart.order_items.empty?
      return redirect to root_url, notice: "Your cart is empty."
    end
  end

  def setup_order
    @order = @current_user.orders.new(session[:order_params])
    @order.credit_card = @current_user.credit_card.nil? ? @order.build_credit_card : @current_user.credit_card.dup
    @order.billing_address = current_user.billing_address.nil? ?  @order.build_billing_address : current_user.billing_address.dup
    @order.shipping_address = current_user.shipping_address.nil? ?  @order.build_shipping_address : current_user.shipping_address.dup
  end

  def set_session
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order.current_step = session[:order_step]
  end

end
