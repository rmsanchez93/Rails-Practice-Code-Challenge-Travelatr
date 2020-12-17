class BloggersController < ApplicationController
    def index 
        @bloggers = Blogger.all
    end 

    def show
        @blogger = Blogger.find(params[:id])
        # It's common to see the variables below defined as methods in the model
        @total_likes = @blogger.posts.map { |post| post.likes }.sum
        @featured_post = @blogger.posts.max_by { |post| post.likes }
        @top_destinations = @blogger.destinations.sort_by { |destination| destination.posts.length }.take(5)
    end

    def new
        @blogger = Blogger.new
    end

    def create 
        # Checking for validations without using a flash hash
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to @blogger
        else
            render :new
        end
    end

    
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end


end