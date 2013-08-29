class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		redirect_to username_path(@user), notice: "Signed up!"
  	else

  	  render 'new'
  	end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_username(params[:username])
  end

  def profile
    render 'show'
  end

  def follow_user
    user = User.find(params[:id])
    relationship = current_user.relationships.build
    relationship.followed_id = user.id
    relationship.save
    redirect_to username_path(user)
  end
end
