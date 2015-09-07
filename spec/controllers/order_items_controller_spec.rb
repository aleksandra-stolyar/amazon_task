require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:cart) { create(:cart) }
  let(:attributes) {
    build(:order_item).attributes
  }
  describe "POST #create" do

    it "creates order_item" do
      # expect_any_instance_of(OrderItem).to receive(:create).
      #   with(attributes_for(:order_item).with_indifferent_access)
      # post :create, order_item: attributes_for(:order_item)

        expect { post :create, cart_id: cart.id,
          order_item: attributes }.to change(OrderItem, :count).by(1)


    end

    # it "redirects to root" do
    #   post :create
    #   expect(response).to redirect_to(cart_url)
    # end    
  end

end
