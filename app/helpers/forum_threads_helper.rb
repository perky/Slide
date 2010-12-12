module ForumThreadsHelper
  
  def get_last_post_user( thread )
    if thread.forum_posts.count > 0 then
      thread.forum_posts.last.user.username
    else
      "noone"
    end
  end
end
