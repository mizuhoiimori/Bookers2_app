class BooksController < ApplicationController

  before_action :ensure_current_user,{only:[:edit,:update, :destroy]}

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      flash[:notice] = "error"
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user = current_user
       render :edit
    else
       redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "successfully."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error."
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
       flash[:notice]="Book was successfully destroyed."
       redirect_to books_path
    end
  end

 private

  def ensure_current_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end