class BloggersController < ApplicationController
# I added the index method just for fun, it is *not* part of the deliverables. You only *need* the show, new and create for this to work at a base level.
    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save
            redirect_to blogger_path(@blogger)
        else
        # I render here instead of redirect so I can get access to the .errors for my model
            render new_blogger_path
        end
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end