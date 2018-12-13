class Post < ApplicationRecord
    belongs_to :place
    validates :title, presence: true
    validates :content, presence: true
    acts_as_taggable
end
