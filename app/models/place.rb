class Place < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true
    geocoded_by :name
    after_validation :geocode
end
