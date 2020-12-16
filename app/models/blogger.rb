class Blogger < ApplicationRecord
# Relationships need to be established, simple many to many with Post as the joiner
    has_many :posts
    has_many :destination, through: :posts

# Validations as requested by the deliverables. This requires a Blogger to have a name that is unique, and a bio that is at least 30 characters
    validates :name, presence: true
    validates :bio, presence: true
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}

# Total likes this blogger has. This is starting with a counter at 0, and then iterating through each of that bloggers posts. For each post, it adds the like count to the total_likes variable, then, it returns the accumulated total_likes
    def total_likes
        total_likes = 0
        self.posts.each do |post|
            total_likes += post.likes
        end
        return total_likes
    end

# To find the featured post, we gather all the posts for this blogger and then order them. With the order method used like this we take in 2 arguments, the first one is which attribute it is examining and the second is the order in which they will be displayed. Here I sorted by likes, descending (so the highest likes will be first) and then took the first object in the array.
    def featured_post
        self.posts.order(likes: :desc)[0]
    end

# This one is a bit more tricky! Finding the top 5 destinations this Blogger has written most about
    def top_5_destinations
        # First, we take the array of posts and group them by destination, saving that to a variable. This creates a hash with a the destination objects as keys, holding the array of posts associated with that destination. Use byebug to check out these values!
        destinations = self.posts.group_by do |post|
          post.destination
        end
        # I used this byebug to make sure I had my hash set up correctly, then used "next" to check out my sorted variable value
        # byebug
        # Then we take that collection, and sort them into an array, using how long the array of posts is that is associated with that Destination as our sorting means. Each index in our sorted array is, itself, an array with the first index being the destination followed by an array of post objects
        sorted = destinations.sort_by do |dest, posts|
          posts.length
        end.reverse
    
        #This takes the (now and array of arrays!) collection and grabs the required data. 
        array = sorted.map do |dest|
          dest[0]
        end
        
        # We then return only the first 5 
        return array[0..4]
    end
end
