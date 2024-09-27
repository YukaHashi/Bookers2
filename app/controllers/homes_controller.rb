class HomesController < ApplicationController
  def top
    @user = User.all
  end
  
  def about
    @user = current_user
  end
end