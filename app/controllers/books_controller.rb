class BooksController < ApplicationController
  # before_filter :authenticate_user!
  load_and_authorize_resource
   # authorize_resource class: false
  def index
    @books = Book.search(params[:search]).order(:title).page(params[:page]).per(8)
  end

  def show
  end

  def search
    @books = Book.search(params[:search])
  end

end
