class UsersController < ApplicationController
  
  before_action :ensure_current_user,{only:[:edit,:update]}
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end

end