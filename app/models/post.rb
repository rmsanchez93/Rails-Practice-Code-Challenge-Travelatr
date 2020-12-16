class Post < ApplicationRecord
# Relationships need to be established, simple many to many with Post as the joiner
    belongs_to :blogger
    belongs_to :destination
#as per the deliverables, this model is required to have a title and content longer than 100 characters 
    validates :title, presence: true
    validates :content, presence: true
    validates :content, length: {minimum: 100}
end
