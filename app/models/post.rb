class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination
    validates :title, presence: true
    validates :content, length: { minimum: 100 }

    def increase_likes
        self.likes = 0 if !self.likes
        new_likes = self.likes + 1
        self.update(likes: new_likes)
    end
end
