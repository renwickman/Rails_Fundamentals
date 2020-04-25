class PostsController < ApplicationController
  layout "three_column"

  def index
    @posts = Post.includes(:user)
    @users = User.all
    render layout: "three_column"
  end

  def create
    
    post = Post.create(post_params)
    redirect_to '/'
  end

  private
  def post_params
      params.require(:post).permit(:title, :content, :user_id)
  end

end
