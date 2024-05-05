class BooksController < ApplicationController
  def new
    @book = book.new
  end

  def index
    # 変数の定義
    
    
  end

  def show
    
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
    
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)  
  end
  
end
