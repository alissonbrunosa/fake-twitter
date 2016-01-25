class HomeController < ApplicationController
  before_action :set_posts, only: [:index, :page]
  def index
  end

  def page
    render 'posts/page', layout: false
  end

  private 
  def set_posts
    page = params[:page] || 1
    @posts = current_user.feed.page(page).per(10)
  end
end
