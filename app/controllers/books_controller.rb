class BooksController < ApplicationController
  def new
    # viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @books = Book.new
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
  end

  def show
  end
  
  # 投稿データのストロングパラメータ
  private
  
  def book_params
    oarams.require(:book).permit(:book, :image, :caption)
  end
end