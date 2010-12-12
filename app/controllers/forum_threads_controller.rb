class ForumThreadsController < ApplicationController
  
  def index
    @forum_threads = ForumThread.order("updated_at DESC")
    render :layout => 'forum'
  end
  
  def nothing
  end
  
  def show
    session[:current_thread_id] = params[:id]
    @current_thread = current_thread
    @forum_threads = ForumThread.order("updated_at DESC")
    cookies[ "thread_"+@current_thread.id.to_s ] = true
    render :layout => 'forum'
    #redirect_to forum_thread_path( params[:id] )
  end
  
  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.build
  end
  
  def create
    @forum_thread = ForumThread.new(params[:forum_thread])
    @forum_thread.user = current_user
    @forum_thread.forum_posts.last.user = current_user
    if @forum_thread.save
      flash[:notice] = "Created new thread."
      redirect_to @forum_thread
    else
      flash[:error] = "Could not create thread."
      render :action => 'new'
    end
  end
  
  def edit
    @forum_thread = ForumThread.find(params[:id])
  end
  
  def update
    @forum_thread = ForumThread.find(params[:id])
    if @forum_thread.update_attributes(params[:forum_thread])
      flash[:notice] = "Successfully updated forum thread."
      redirect_to @forum_thread
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @forum_thread = ForumThread.find(params[:id])
    @forum_thread.destroy
    flash[:notice] = "Successfully destroyed forum thread."
    redirect_to forum_threads_url
  end
  
  def select_thread
    session[:current_thread_id] = params[:id]
    @current_thread = current_thread
    redirect_to forum_threads_path
  end
end
