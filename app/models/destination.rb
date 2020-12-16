class Destination < ApplicationRecord
# Relationships need to be established, simple many to many with Post as the joiner
    has_many :posts
    has_many :bloggers, through: :posts

# To find the featured post, we gather all the posts associated to this destination and then order them. With the order method like this we take in 2 arguments, the first one is which attribute it is examining and the second is the order in which they will be displayed. Here I sorted by likes, descending (so the highest likes will be first) and then took the first object in the array.
    def featured_post
        self.posts.order(likes: :desc)[0]
    end

# Posts are added to the DB chronologically, so the last 5 posts in the DB will be the most recent ones posted. We reverse the array of posts and grab the first 5 values!
    def most_recent_5
        self.posts.reverse[0..4]
    end

# For average age we do it in multiple steps
    def average_age
    # When I was testing this I had a destination have nobody write about it yet, which would mean at the end of this function I divided by 0 (math says don't do that). I wrote in a catch for what happens if there are no posts about that destination yet.
        if self.bloggers.length < 1
            return "No one has written about this yet"
        end
    #first we use the built in Ruby function distinct to get an array of unique blogger objects
        unique_bloggers = self.bloggers.distinct
    # Average is total/count, so to get started we set a variable to 0 that will collect everyones total age
        total_age = 0
        unique_bloggers.each do |blogger|
            total_age += blogger.age
        end
    # We diving to total age by the number of bloggers
        average_age = total_age/unique_bloggers.length
    # Then return the average age!
        return average_age
    end

end
