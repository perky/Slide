require 'test_helper'

class ThreadsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Thread.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Thread.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Thread.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to thread_url(assigns(:thread))
  end
  
  def test_edit
    get :edit, :id => Thread.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Thread.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Thread.first
    assert_template 'edit'
  end

  def test_update_valid
    Thread.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Thread.first
    assert_redirected_to thread_url(assigns(:thread))
  end
  
  def test_destroy
    thread = Thread.first
    delete :destroy, :id => thread
    assert_redirected_to threads_url
    assert !Thread.exists?(thread.id)
  end
end
