class ChangeCountriesInAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :country_id
    add_column :addresses, :country, :string
  end
end
