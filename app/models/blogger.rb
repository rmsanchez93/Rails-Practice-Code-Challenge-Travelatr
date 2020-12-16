class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.sum(:likes)
    end

    def featured_post
        self.posts.order(likes: :desc).first
    end

    def top_destinations
        self.posts.group('destination_id').order('count_id desc').count('id')
    end
end
