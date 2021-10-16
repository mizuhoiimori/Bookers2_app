class UsersController < ApplicationController

before_action :ensure_current_user, only: [:edit, :update, :destroy]

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
  end

  def update
    @user = current_user
      if @user.update(user_params)
        flash[:notice] = "successfully."
        redirect_to user_path(@user.id)
      else
        flash[:notice] = "error."
        render 'edit'
      end
  end

  private

  def ensure_current_user
      @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end

end