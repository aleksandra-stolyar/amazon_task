class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float     :total_price
      t.datetime  :completed_date
      t.integer   :status, default: 0
      t.integer   :credit_card_id
      t.integer   :customer_id

      t.timestamps
    end
  end
end
