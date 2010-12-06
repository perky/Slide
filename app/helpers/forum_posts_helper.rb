module ForumPostsHelper
  
  def get_post_time( post )
    distance_of_time_in_words(Time.zone.now.to_f, post.created_at.to_f)
  end
  
end
