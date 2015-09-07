class RemoveOrderIdFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :order_id
  end
end
