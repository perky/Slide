module ForumThreadsHelper
  
  def get_last_post_user( thread )
    thread.forum_posts.last.user.username
  end
end
