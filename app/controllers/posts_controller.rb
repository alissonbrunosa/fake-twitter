class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to home_index_path
    else
      render 'home/index'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to home_index_path
  end


  private 
  def post_params
    params.require(:post).permit(:body)
  end
end
