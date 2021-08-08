class UsersController < ApplicationController
  before_action :set_user
  def show
    @tweets = @user.tweets.order('created_at DESC').page(params[:page])
  end

  def followers
    @users = @user.followers.page(params[:page])
  end

  def followed
    @users = @user.followees.page(params[:page])
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end 

end
