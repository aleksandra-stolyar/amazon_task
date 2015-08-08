class BooksController < ApplicationController
  # before_filter :authenticate_user!
  # load_and_authorize_resource
   # authorize_resource class: false
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
  end

  def book_params
    params.require(:book).permit(:title, :price, :amount)
  end  

end
