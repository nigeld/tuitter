class UsersController < ApplicationController
  before_action :set_user
  def show

  end

  def followers
  end

  def followed
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end 

end
