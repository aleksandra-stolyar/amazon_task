class AddStateToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :state, :integer, default: 0
  end
end
