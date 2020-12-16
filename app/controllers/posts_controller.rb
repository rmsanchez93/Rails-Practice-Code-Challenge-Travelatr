class PostsController < ApplicationController
# Any regular crud actions I won't go into too much depth over, these should be familiar by now
    def show
      @post = Post.find(params[:id])
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        redirect_to post_path(@post)
      else
        # I render here instead of redirect so I can get access to the .errors for my model
        render new_post_path
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
  
      if @post.update(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end
    end
    
#   What is this? A custom action? Exciting! We set up routes that when the button on the Post Show page is pressed, it follows the like_path to fire off this method, incrimenting our likes and redirecting us to the page with our updated model.
    def like
      @post = Post.find(params[:id])
      @post.likes += 1
      @post.save
  
      redirect_to post_path(@post)
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
  end