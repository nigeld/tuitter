class TweetsController < ApplicationController
    def index 
        @tweets = Tweet.all
    end

    def new 
        @tweet = Tweet.new
    end

    def create 
        @tweet = current_user.tweets.new(tweet_params)

        respond_to do |format|
            if @tweet.save
              format.html { redirect_to tweets_url, notice: "Tweet was posted!" }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private 

    def set_tweet
        @tweet = Tweet.find(params[:id])
    end

    def tweet_params
        params.require(:tweet).permit(:text)
    end



end
