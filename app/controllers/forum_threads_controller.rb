class ForumThreadsController < ApplicationController
  def index
    @forum_threads = ForumThread.order("updated_at DESC")
    @forum_post    = ForumPost.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def nothing
  end
  
  def show
    @forum_thread = ForumThread.find(params[:id])
  end
  
  def new
    @forum_thread = ForumThread.new
  end
  
  def create
    @forum_thread = ForumThread.new(params[:forum_thread])
    if @forum_thread.save
      flash[:notice] = "Successfully created forum thread."
      redirect_to @forum_thread
    else
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
