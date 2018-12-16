class Place < ApplicationRecord
    has_many :posts
    validates :name, presence: true
    validates :content, presence: true
    acts_as_taggable
    acts_as_followable
    acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude
end
