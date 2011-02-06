require 'test_helper'

class PlayerEventsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PlayerEvent.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PlayerEvent.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PlayerEvent.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to player_event_url(assigns(:player_event))
  end

  def test_edit
    get :edit, :id => PlayerEvent.first
    assert_template 'edit'
  end

  def test_update_invalid
    PlayerEvent.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PlayerEvent.first
    assert_template 'edit'
  end

  def test_update_valid
    PlayerEvent.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PlayerEvent.first
    assert_redirected_to player_event_url(assigns(:player_event))
  end

  def test_destroy
    player_event = PlayerEvent.first
    delete :destroy, :id => player_event
    assert_redirected_to player_events_url
    assert !PlayerEvent.exists?(player_event.id)
  end
end
