class DestinationsController < ApplicationController
# What an empty controller...that's okay, for our app right now this is all the Destinations should do.
    def show
        @destination = Destination.find(params[:id])
    end
end