class DropCountries < ActiveRecord::Migration
  def change
    drop_table :countries do |t|
      t.string :country
      t.timestamps
    end
  end
end
