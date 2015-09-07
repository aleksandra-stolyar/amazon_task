class AddDeliveryTypeIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_type_id, :integer
  end
end
