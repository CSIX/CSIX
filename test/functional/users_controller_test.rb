require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => {:username => "ben", :email => "hh@hh.com", :password => "benrocks", :password_confirmation => "benrocks"}
    end
    assert_redirected_to root_url
  end

  test "should create not create user" do
    post :create, :user => {:username => "ben", :email => "hsdfh.com", :password => "benrocks", :password_confirmation => "benrocks"}
    assert_template :new
  end

  test "should show user" do
    get :show, :id => users(:admin).id
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    UserSession.create(:username => "admin", :password => "1234" )
    get :edit, :id => User.find_by_username("admin").id
    assert_response :success
    assert_template :edit
  end

  test "should not get edit" do
    UserSession.create(:username => "user", :password => "1234" )
    get :edit, :id => User.find_by_username("admin").id
    assert_redirected_to root_url
    
    get :edit, :id => User.find_by_username("admin").id
    assert_redirected_to root_url
  end

  test "should_update_user_valid" do
    UserSession.create(:username => "admin", :password => "1234" )
    put :update, :user => {:username => "admin", :email => "admin@salij.org", :password => "1234", :password_confirmation => "1234"}
    assert_equal flash[:notice], "Successfully updated user info."
    assert_nil flash[:error]
    assert_template :edit
  end
  
  test "should_update_user_invalid" do
    UserSession.create(:username => "admin", :password => "1234" )
    put :update, :user => {:username => "admin", :email => "admin@salij.org", :password => "134", :password_confirmation => "1224"}
    assert_nil flash[:notice]
    assert_equal flash[:error], "Sorry But something went wrong."
    assert_template :edit
  end

end
