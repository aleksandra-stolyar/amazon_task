class ChangeDescriptionTypeInBooks < ActiveRecord::Migration
  def change
    change_column :books, :description, :text
  end
end
