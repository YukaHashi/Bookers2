class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
  
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "successfully"
      redirect_to user_path
    else
      flash.now[:alert] = "error"
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
