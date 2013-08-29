class TweetsController < ApplicationController

	def new
		@tweet = Tweet.new
	end

	def create
  	@tweet = current_user.tweets.build(params[:tweet])
  	if params[:tweet][:private] == 1
  		set_private_as_private
  	end
  	if @tweet.save
  		redirect_to user_path(current_user.id), notice: "New tweet created!"
  	else
  		render "users/show"
  	end
  end

  def destroy
  end
end
