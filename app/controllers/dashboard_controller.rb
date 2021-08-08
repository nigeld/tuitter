class DashboardController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @tweets = []
    current_user.followees.each do |followed|
      followed.tweets.each do |tweet|
        @tweets << tweet
      end
    end
    @tweets.sort_by { |tweet| tweet[:created_at]}
    @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)
  end
end
