class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
    @user = current_user
    @books = Book.all
  end
  
  # 投稿データの保存
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      flash.now[:alert] = "error"
      render :new
    end
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
    @books = Book.find(params[:id])
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  # 投稿データのストロングパラメータ
  private
  
  def book_params
    params.permit(:title, :body)
  end
end
