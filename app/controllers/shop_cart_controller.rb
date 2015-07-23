class ShopCartController < ApplicationController

  def add_item
    @shop_cart.add(params[:item][:id], params[:item][:quantity])
    redirect_to '/'
  end

  def index

  end

end