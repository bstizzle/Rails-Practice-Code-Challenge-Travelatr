class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def feat_post
        favorite = self.posts.first
        self.posts.each do |p|
            if p.likes > favorite.likes
                favorite = p 
            end
        end
        favorite
    end

    def avg_age
        self.bloggers.map{|b| b.age}.sum / self.bloggers.count
    end

end
