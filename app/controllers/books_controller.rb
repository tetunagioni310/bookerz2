class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to "/books/#{ @book.id }"
    else
      @books = Book.all
      render 'index'
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    redirect()
  end
end
