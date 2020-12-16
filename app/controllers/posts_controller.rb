class PostsController < ApplicationController
  before_action :get_post, only: [:edit, :update, :show, :like]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.likes = 0
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
  end

  def like
    @post.increase_likes
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
