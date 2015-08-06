class RenameCustomerIdToUserIdInCreditCards < ActiveRecord::Migration
  def change
    rename_column :credit_cards, :customer_id, :user_id
  end
end
