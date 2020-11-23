class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}

    def total_likes
        likes = 0
        self.posts.each { |p| likes += p.likes }
        likes
    end

    def feat_post
        favorite = self.posts.first
        self.posts.each do |p|
            if p.likes > favorite.likes
                favorite = p 
            end
        end
        favorite
    end
end
