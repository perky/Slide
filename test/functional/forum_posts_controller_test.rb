require 'test_helper'

class ForumPostsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ForumPost.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ForumPost.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ForumPost.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to forum_post_url(assigns(:forum_post))
  end
  
  def test_edit
    get :edit, :id => ForumPost.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ForumPost.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ForumPost.first
    assert_template 'edit'
  end

  def test_update_valid
    ForumPost.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ForumPost.first
    assert_redirected_to forum_post_url(assigns(:forum_post))
  end
  
  def test_destroy
    forum_post = ForumPost.first
    delete :destroy, :id => forum_post
    assert_redirected_to forum_posts_url
    assert !ForumPost.exists?(forum_post.id)
  end
end
