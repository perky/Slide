class ForumPostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :ajax, :search]
  
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
      push @forum_post
      respond_to do |format|
        format.html { goto_thread_with_anchor @forum_post }
        format.js
      end
    else
      render :action => 'new'
    end
  end
  
  def push( post )
    Pusher["#{current_thread.id}-posts"].trigger('post-create', post.id)
    Pusher["all_threads"].trigger('thread-newpost', { "id" => post.forum_thread.id, "count" => post.forum_thread.forum_posts.count } )
  end
  
  def ajax
    @forum_post = ForumPost.find( params[:id] )
    @test = "hello"
  end
  
  def edit
    @forum_post = ForumPost.find(params[:id])
  end
  
  def update
    @forum_post = ForumPost.find(params[:id])
    if @forum_post.update_attributes(params[:forum_post])
      flash[:notice] = "Successfully updated forum post."
      goto_thread_with_anchor @forum_post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @forum_post = ForumPost.find(params[:id])
    @forum_post.destroy
    flash[:notice] = "Successfully destroyed forum post."
    redirect_to current_thread
  end
  
  def search
    @found_posts = ForumPost.search_content( params[:search] )
    #ForumThreadsController::index
    @forum_threads = ForumThread.order("updated_at DESC")
    @forum_post    = ForumPost.new
    render 'forum_threads/index'
  end
  
  private
end
