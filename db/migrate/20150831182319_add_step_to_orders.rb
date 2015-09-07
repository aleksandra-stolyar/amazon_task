class AddStepToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :step, :integer, default: 0
  end
end
