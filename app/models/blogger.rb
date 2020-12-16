class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    # validate :bio_length


    def total_likes
        arr = self.posts.map do | post |
            post.likes
        end
        arr.sum
    end

    # def bio_length
    #    if self.bio.length >= 30
    #     self.errors.push("bio should be at least 30 characters")
    #    end
    # end

    def featured_post 
        self.posts.order(likes: :desc)[0]
    end
end
