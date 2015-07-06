class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :address
      t.integer :zip_code
      t.string  :city
      t.string  :phone
      t.integer :country_id
      t.integer :order_id

      t.timestamps
    end
  end
end
