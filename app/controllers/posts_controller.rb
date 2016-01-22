class PostsController < ApplicationController
  def create
    @post = current_user.posts.create(post_params)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
  end


  private 
  def post_params
    params.require(:post).permit(:body)
  end
end
