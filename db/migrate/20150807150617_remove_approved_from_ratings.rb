class RemoveApprovedFromRatings < ActiveRecord::Migration
  def change
    remove_column :ratings, :approved
  end
end
