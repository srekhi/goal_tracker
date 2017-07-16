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
      redirect_to root_url
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post
      @post.destroy
    else
      flash[:errors] = ["Post doesn't exist"]
    end
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:body, :author)
  end
end
