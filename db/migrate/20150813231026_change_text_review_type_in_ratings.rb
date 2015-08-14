class ChangeTextReviewTypeInRatings < ActiveRecord::Migration
  def change
    change_column :ratings, :text_review, :text
  end
end
