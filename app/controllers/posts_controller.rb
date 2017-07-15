class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
    else
    end 

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
