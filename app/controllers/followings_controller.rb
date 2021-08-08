class FollowingsController < ApplicationController
    before_action :set_user
    def new
        current_user.follow_user(@user)
        redirect_to user_profile_url({username: @user.username}) and return
    end

    def destroy
        current_user.unfollow_user(@user)

        current_user.reload
    end

    private 

    def set_user
        @user = User.find_by(username: params[:id])
    end
end
