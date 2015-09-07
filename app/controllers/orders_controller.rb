class OrdersController < ApplicationController

  before_filter :setup_order, only: [:new, :steps, :finish]
  before_filter :check_cart, only: :new
  load_and_authorize_resource :order

  def check_cart
    if @current_cart.order_items.empty?
      return redirect to root_url, notice: "Your cart is empty."
    end
  end

  def setup_order
    @order = Order.new(session[:order_params])
    @order.credit_card = current_user.set_credit_card.dup
  end

  def index
  end

  def show

  end

  def new
    session[:order_params] ||= {}
    session[:order_step] = @order.first_step

    render '/orders/new'
  end

  # def create
  #   binding.pry
  #   @order.add_order_items_from_cart(@current_cart)
  #   @order.save if @order.all_valid?
  #   session[:order_step] = session[:order_params] = nil
  #   flash[:notice] = "Order saved."
  #   redirect_to order_url
  # end

  def finish
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order.current_step = session[:order_step]

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

  def steps
    session[:order_params].deep_merge!(params[:order]) if params[:order]
    @order.current_step = session[:order_step]
    if @order.valid?
      if params[:back_button]
        @order.previous_step
        render 'new'
      # elsif @order.last_step?
      #   # binding.pry
      #   # redirect_to orders_path(:order => params[:order], :method => :post)
      #   @order.add_order_items_from_cart(@current_cart)
      #   @order.save if @order.all_valid?
      #   session[:order_step] = session[:order_params] = nil
      #   flash[:notice] = "Order saved."
      #   redirect_to @order
      else  
        @order.next_step
        render 'new'
      end
      session[:order_step] = @order.current_step
    end
  end

end
