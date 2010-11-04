class Post < ActiveRecord::Base
    belongs_to :user
    has_many :tasks, :dependent => :destroy 
    accepts_nested_attributes_for :tasks
    has_many :comments, :dependent => :destroy
    has_many :bids, :dependent => :destroy
end
