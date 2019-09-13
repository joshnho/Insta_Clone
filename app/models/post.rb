class Post < ApplicationRecord
    acts_as_votable
    belongs_to :user
    has_many :likes
    has_many :users, through: :likes
    
end
