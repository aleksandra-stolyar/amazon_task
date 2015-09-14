class RemoveStepsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :step
  end
end
