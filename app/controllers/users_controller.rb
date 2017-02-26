class UsersController < ApplicationController

  def show
    @user = User.find_by_id(:id)
    @reviews = @user.reviews 
  end


end
