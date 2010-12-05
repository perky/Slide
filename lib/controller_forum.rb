module ControllerForum
  def self.included(controller)
    controller.send :helper_method, :current_thread
  end
  
  def current_thread
    id = session[:current_thread_id] || 1
    @current_thread ||= ForumThread.find( id )
  end
end