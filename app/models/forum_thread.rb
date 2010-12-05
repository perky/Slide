class ForumThread < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :catagory_id
  belongs_to :user
  has_many :forum_posts
end
