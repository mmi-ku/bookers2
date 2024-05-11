class BooksController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @book_new = Book.new
    
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
       redirect_to book_path(@book)
     else
      render :new
     end
  end

  private
  def book_params
    params.require(:book).permit(:book_title, :book_review, :image)
  end
  
  # def is_matching_login_user
  #   @book =Book.find(params[:id])
  #   user = @book.user
  #   unless user.id == current_user.id
  #     redirect_to book_path(@book)
  #   end
  # end
    
end
