class ForumPost < ActiveRecord::Base
  attr_accessible :content, :user_id, :thread_id
  belongs_to :forum_thread, :touch => true
  belongs_to :user
  
  validates_presence_of :content
  
  def self.search_content( content )
    sql = "SELECT * FROM forum_posts WHERE content like ?"
    find_by_sql [ sql, "%#{content}%" ]
  end
  
end
