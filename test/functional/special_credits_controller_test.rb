require 'test_helper'

class SpecialCreditsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SpecialCredit.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SpecialCredit.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SpecialCredit.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to special_credit_url(assigns(:special_credit))
  end

  def test_edit
    get :edit, :id => SpecialCredit.first
    assert_template 'edit'
  end

  def test_update_invalid
    SpecialCredit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SpecialCredit.first
    assert_template 'edit'
  end

  def test_update_valid
    SpecialCredit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SpecialCredit.first
    assert_redirected_to special_credit_url(assigns(:special_credit))
  end

  def test_destroy
    special_credit = SpecialCredit.first
    delete :destroy, :id => special_credit
    assert_redirected_to special_credits_url
    assert !SpecialCredit.exists?(special_credit.id)
  end
end
