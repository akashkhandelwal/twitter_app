class TweetsController < ApplicationController

	def new
		@tweet = Tweet.new
	end

	def create
  	@tweet = Tweet.new(params[:tweet])
  	if params[:tweet][:private] == 1
  		set_tweet_as_private
  	end
  	if @tweet.save
      @tweet.associate_tweet_with_user current_user
  		redirect_to username_path(current_user), notice: "New tweet created!"
  	else
      @user = current_user
  		render "users/show"
  	end
  end

  def retweet
    tweet = Tweet.find(params[:id])
    tweet.associate_tweet_with_user current_user
    redirect_to username_path(current_user)
  end
end
