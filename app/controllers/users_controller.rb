class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def autocomplete
    @users = User.autocomple_name(params[:term]) 
  end

  def follow
    current_user.following << User.find(params[:id])
    redirect_to user_path(params[:id])
  end

  def unfollow
    current_user.following.destroy(params[:id])
    redirect_to user_path(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
end