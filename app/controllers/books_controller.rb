class BooksController < ApplicationController
  before_action :correct_user, only: [:edit,:update]
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to "/books/#{@book.id}"
    else
      render 'edit'
    end
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
    @user = User.find_by(id: @book.user_id)
    redirect_to "/books" unless @user == current_user
  end
end
