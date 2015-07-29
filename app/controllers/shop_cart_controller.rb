class ShopCartController < ApplicationController

  def add_item
    # binding.pry
    @shop_cart.add(params[:item][:id], params[:item][:quantity])
    redirect_to '/'
  end

  def build_order
    order = @shop_cart.build_order
    order.save
    @shop_cart.empty!

    redirect_to '/order'
  end

end