class AddOrderIdToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :order_id, :integer
  end
end
