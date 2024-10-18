class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
    @user = current_user
    @books = Book.all
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      flash.now[:alert] = "error"
      render :index
    end
  end

  def index
    @book = Book.new
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

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book.id)
  end
  
  # 投稿データのストロングパラメータ
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
