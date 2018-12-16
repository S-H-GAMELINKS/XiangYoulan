class Post < ApplicationRecord
    belongs_to :place
    validates :title, presence: true
    validates :content, presence: true
    acts_as_taggable
    include PublicActivity::Model
    tracked :owner => Proc.new{ |controller, model| model.place }
end
