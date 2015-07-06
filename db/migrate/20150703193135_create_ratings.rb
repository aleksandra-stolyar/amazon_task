class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string  :text_review
      t.integer :rate
      t.integer :book_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
