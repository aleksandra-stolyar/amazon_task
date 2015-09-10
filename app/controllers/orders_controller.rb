class OrdersController < ApplicationController
  # load_and_authorize_resource :through => :current_user, only: [:show, :index]
  load_resource :through => :current_user# , only: :setup_order

  before_filter :check_cart, only: :new
  before_filter :set_session, only: [:steps, :finish]
  before_filter :setup_order, only: [:new, :steps, :finish]

  def index
  end

  def show
  end

  def new
    session[:order_params] ||= {}
    session[:order_step] = @order_form.first_step
    render '/orders/new'
  end

  def steps
    if @order_form.last_step?
      finish
    else
      if params[:back_button]
        @order_form.previous_step 
      elsif @order_form.valid?
        @order_form.next_step
      end

      session[:order_step] = @order_form.current_step
      render 'new'
    end
  end

  def finish
    raise "Can't submit form!" unless @order_form.last_step?
    @order_form.save

    session[:order_step] = session[:order_params] = nil
    flash[:notice] = "Order saved."
    redirect_to @order_form.order
  end

  def check_cart
    if @current_cart.order_items.empty?
      return redirect to root_url, notice: "Your cart is empty."
    end
  end

  def setup_order
    @order_form = OrderForm.new(current_user.orders.new, session, @current_cart)
  end

  def set_session
    session[:order_params].deep_merge!(params[:order_form]) if params[:order_form]
  end
end
