class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    # @user=User.find(@Book.user_id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book.user_id)
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
    redirect_to book_path
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
end
