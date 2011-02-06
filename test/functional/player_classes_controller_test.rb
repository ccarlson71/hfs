require 'test_helper'

class PlayerClassesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PlayerClass.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PlayerClass.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PlayerClass.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to player_class_url(assigns(:player_class))
  end

  def test_edit
    get :edit, :id => PlayerClass.first
    assert_template 'edit'
  end

  def test_update_invalid
    PlayerClass.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PlayerClass.first
    assert_template 'edit'
  end

  def test_update_valid
    PlayerClass.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PlayerClass.first
    assert_redirected_to player_class_url(assigns(:player_class))
  end

  def test_destroy
    player_class = PlayerClass.first
    delete :destroy, :id => player_class
    assert_redirected_to player_classes_url
    assert !PlayerClass.exists?(player_class.id)
  end
end
