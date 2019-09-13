class User < ApplicationRecord
    acts_as_voter
    has_many :posts
    has_many :likes
    has_many :liked_posts, :class_name => "Post", through: :likes 

    validates :username, presence: :true, uniqueness: :true

    validates :password, presence: :true, length: {:within => 6..40}

    has_secure_password
end