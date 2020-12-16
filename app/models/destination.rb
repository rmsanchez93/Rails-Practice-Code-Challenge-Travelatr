class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        self.posts.order(likes: :desc)[0]
    end

    def most_recent_5
        if self.posts.length < 1 
            return []
        end
        self.posts.reverse[0..4]
    end

    def average_age

        if self.bloggers.length < 1
            return "No one has written about this yet"
        end

        unique_bloggers = self.bloggers.distinct
        total_age = 0

        unique_bloggers.each do |blogger|
            total_age += blogger.age
        end

        average_age = total_age/unique_bloggers.length

        return average_age
    end
end
