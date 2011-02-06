require 'test_helper'

class CreditEntriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CreditEntry.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CreditEntry.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CreditEntry.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to credit_entry_url(assigns(:credit_entry))
  end

  def test_edit
    get :edit, :id => CreditEntry.first
    assert_template 'edit'
  end

  def test_update_invalid
    CreditEntry.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CreditEntry.first
    assert_template 'edit'
  end

  def test_update_valid
    CreditEntry.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CreditEntry.first
    assert_redirected_to credit_entry_url(assigns(:credit_entry))
  end

  def test_destroy
    credit_entry = CreditEntry.first
    delete :destroy, :id => credit_entry
    assert_redirected_to credit_entries_url
    assert !CreditEntry.exists?(credit_entry.id)
  end
end
