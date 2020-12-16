class BloggersController < ApplicationController

    def new
        # view form with blogger object 
        @blogger = Blogger.new
    end

    def create 
        # after form is submitted with data
        blogger = Blogger.create(blogger_params) 
        redirect_to blogger_path(blogger)
    end

    def show 
        @blogger = Blogger.find(params[:id])
    end

    private 
    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end
end
