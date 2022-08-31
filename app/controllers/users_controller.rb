class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless current_user?(@user)
  end
end
