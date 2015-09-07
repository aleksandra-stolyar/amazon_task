class OrderItemsController < ApplicationController

  load_and_authorize_resource :order_item, except: :create

  def create
    @order_item = @current_cart.order_items.build(order_item_params)
    if @order_item.save
      redirect_to cart_path, notice: "#{@order_item.book.title} successfully added to cart!"
    else
      redirect_to :back, alert: "Error: Cart is still empty"
    end
  end

  def update
    @order_item.update_attributes(order_item_params)
    redirect_to cart_url
  end

  def destroy
    @order_item.destroy!
    redirect_to cart_url
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end

end