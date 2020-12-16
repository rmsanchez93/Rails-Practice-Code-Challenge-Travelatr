class PostsController < ApplicationController

    def show 
        @post = Post.find(params[:id])
    end

    def create 
        # creating that data
        @post = Post.create(post_params)
        redirect_to post_path(@post) 
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update
        # find post 
        @post = Post.find(params[:id])
        # update and save post 
        @post.update(post_params)
        # redirect
        redirect_to post_path(@post)
    end

    def new 
        # get a form
        @post = Post.new
    end

    def increase_likes
        # I wnat to increase likes here
        post = Post.find(params[:id])
        post.likes += 1
        post.save
        redirect_to post_path(post)
    end

    def post_params
        params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
        # byebug
    end
end
