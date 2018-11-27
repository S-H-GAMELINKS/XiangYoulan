class Place < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true
end
