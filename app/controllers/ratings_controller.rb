class RatingsController < ApplicationController
  load_and_authorize_resource
  def new
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.create(rating_params)
    redirect_to book_path(@book)
  end

  private
  def rating_params
    params.require(:rating).permit(:review_title, :rate, :text_review, :user_id)
  end
end