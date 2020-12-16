class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent
        self.posts.order(created_at: :desc).first(5)
    end

    def featured_post
        self.posts.order(likes: :desc).first
    end

    def average_blogger_age
        # self.bloggers.distinct.average(:age)
        ages = self.bloggers.distinct.pluck(:age)
        ages.sum / ages.length
    end
end
