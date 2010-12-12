class ForumThread < ActiveRecord::Base
  
  belongs_to :user
  has_many :forum_posts
  accepts_nested_attributes_for :forum_posts, :allow_destroy => :true
end