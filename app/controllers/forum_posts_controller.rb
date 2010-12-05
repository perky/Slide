class ForumPostsController < ApplicationController
  def index
    @forum_posts = ForumPost.all
  end
  
  def show
    @forum_post = ForumPost.find(params[:id])
  end
  
  def new
    @forum_post = ForumPost.new
  end
  
  def create
    @forum_post = ForumPost.new(params[:forum_post])
    @forum_post.user_id = current_user.id
    @forum_post.forum_thread_id = current_thread.id
    
    if @forum_post.save
      @forum_post.touch
      flash[:notice] = "Successfully created forum post."
      Pusher["#{current_thread.id}-posts"].trigger('post-create', @forum_post.attributes)
      respond_to do |format|
        format.html { redirect_to forum_threads_path }
        format.js { render 'forum_threads/new_post.js' }
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum_post = ForumPost.find(params[:id])
  end
  
  def update
    @forum_post = ForumPost.find(params[:id])
    if @forum_post.update_attributes(params[:forum_post])
      flash[:notice] = "Successfully updated forum post."
      redirect_to @forum_post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @forum_post = ForumPost.find(params[:id])
    @forum_post.destroy
    flash[:notice] = "Successfully destroyed forum post."
    redirect_to forum_posts_url
  end
  
  def search
    @found_posts = ForumPost.search_content( params[:search] )
    #ForumThreadsController::index
    @forum_threads = ForumThread.order("updated_at DESC")
    @forum_post    = ForumPost.new
    render 'forum_threads/index'
  end
end
