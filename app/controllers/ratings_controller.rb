class RatingsController < ApplicationController
  load_and_authorize_resource
  def new
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.new
  end

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.create(rating_params)

    if @rating.save
      redirect_to @book, notice: 'Your review was successfully added.'
    else
      render :new
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:review_title, :rate, :text_review, :user_id, :book_id)
  end
end