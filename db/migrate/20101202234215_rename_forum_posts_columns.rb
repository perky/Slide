class RenameForumPostsColumns < ActiveRecord::Migration
  def self.up
    rename_column :forum_posts, :thread_id, :forum_thread_id
  end

  def self.down
    rename_column :forum_posts, :forum_thread_id, :thread_id
  end
end
