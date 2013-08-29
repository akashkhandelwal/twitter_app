class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.new(params[:user])
  	if user.save
  		sign_in user
  		redirect_to user_path(user), notice: "Signed up!"
  	else
  		render "new"
  	end
  end

  def index
    @users = User.all
  end

  def show
  end

  def follow_user
    debugger
  end
end
