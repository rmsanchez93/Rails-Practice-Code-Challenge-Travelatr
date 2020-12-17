class DestinationsController < ApplicationController
    def index 
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        # It's common to see the variables below defined as methods in the model
        @recent_five = @destination.posts.reverse.take(5)
        @featured_post = @destination.posts.max_by { |post| post.likes }
        @average_age = @destination.bloggers.uniq.map { |blogger| blogger.age }.sum / @destination.bloggers.uniq.length
    end 

end