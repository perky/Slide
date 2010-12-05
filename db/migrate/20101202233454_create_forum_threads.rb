class CreateForumThreads < ActiveRecord::Migration
  def self.up
    create_table :forum_threads do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :catagory_id
      t.timestamps
    end
  end

  def self.down
    drop_table :forum_threads
  end
end
