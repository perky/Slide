module ApplicationHelper
  
  def signed_in?
    !current_user.nil?
  end

  def get_threads
    @forum_threads ||= ForumThread.order("updated_at DESC")
  end

end
