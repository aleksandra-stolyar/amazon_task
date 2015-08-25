class BooksController < ApplicationController
  # before_filter :authenticate_user!
  load_and_authorize_resource
   # authorize_resource class: false
  def index
    @books = Book.all.order(:title).page(params[:page]).per(6)
  end

  def show
  end

end
