class CreateBooksCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :books_categories, id: false do |t|
      t.references :book, :category 
    end
  end
end
