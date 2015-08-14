class AddReviewTitleToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :review_title, :string
  end
end
