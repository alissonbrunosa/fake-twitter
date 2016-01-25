class PublicController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    page = params[:page] || 1
    @posts = Post.includes(:user).page(page).per(10)
  end
end
