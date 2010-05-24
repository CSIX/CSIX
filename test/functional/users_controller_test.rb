require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_user_invalid
    post :create, :user => {:username => "ben", :email => "hsdfh.com", :password => "benrocks", :password_confirmation => "benrocks"}
    assert_template 'new'
  end

  def test_create_valid_user
    assert_difference('User.count') do
      post :create, :user => {:username => "ben", :email => "hh@hh.com", :password => "benrocks", :password_confirmation => "benrocks"}
    end
    assert_redirected_to root_url
  end

  def test_should_show_user
    get :show, :id => users(:admin).id
    assert_response :success
    assert_template :show
  end

  def test_should_get_edit
    UserSession.create(:username => "admin", :password => "1234" )
    get :edit, :id => User.find_by_username("admin").id
    assert_response :success
    assert_template :edit
  end

  def test_should__not_get_edit
    get :edit, :id => User.find_by_username("admin").id
    assert_redirected_to root_url
  end

  def test_should_update_user_valid
    UserSession.create(:username => "admin", :password => "1234" )
    put :update, :user => {:username => "admin", :email => "admin@salij.org", :password => "1234", :password_confirmation => "1234"}
    assert_equal flash[:notice], "Successfully updated user info."
    assert_nil flash[:error]
    assert_template :edit
  end
  
  def test_should_update_user_invalid
    UserSession.create(:username => "admin", :password => "1234" )
    put :update, :user => {:username => "admin", :email => "admin@salij.org", :password => "134", :password_confirmation => "1224"}
    assert_nil flash[:notice]
    assert_equal flash[:error], "Sorry But something went wrong."
    assert_template :edit
  end

end
