class PagesController < ApplicationController
  
  def home
    @forum_threads = ForumThread.order("updated_at DESC")
    render :layout => 'forum'
  end
  
  def user_profile
  end
  
  def user_dashboard
  end
  
end