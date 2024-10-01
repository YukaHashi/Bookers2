class HomesController < ApplicationController
  def top
    @user = current_user
    @books = Book.all
  end
  
  def create
    @book = Book.new(Book_params)
    @book.save
    redirect_to '/top'
  end
  
  def about
    @user = current_user
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end