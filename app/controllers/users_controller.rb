class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user = current_user
      redirect_to edit_user_path
    else
      render edit_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end

end