class Place < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true
    acts_as_taggable
end
