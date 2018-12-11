class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    acts_as_taggable
    acts_as_follower
end
