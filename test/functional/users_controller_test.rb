require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)

  def test_should_get_new
    get :new
    assert_response :success
  end
    
  def test_create_invalid
    post :create, :user => {:username => "ben", :email => "hsdfh.com", :password => "benrocks", :password_confirmation => "benrocks"}
    assert_template 'new'
  end
     
  def test_create_valid
    post :create, :user => {:username => "ben", :email => "hh@hh.com", :password => "benrocks", :password_confirmation => "benrocks"}
    assert_redirected_to root_url
  end
  
     # 
     # def test_edit
     #   get :edit, :id => User.first
     #   assert_template 'edit'
     # end
     
     # def test_update_invalid
     #       User.any_instance.stubs(:valid?).returns(false)
     #       put :update, :id => User.first
     #       assert_template 'edit'
     #     end
     #     
     #     def test_update_valid
     #       User.any_instance.stubs(:valid?).returns(true)
     #       put :update, :id => User.first
     #       assert_redirected_to root_url
     #     end
  
  
  
  # def test_should_get_new
  #      get :new
  #      assert_response :success
  #    end
  # 
  #    def test_should_create_user
  #      firstCount = User.count
  #      puts User.count
  #      post :create, :user => { :username => "ben", :email => "hh@hh.com", :password => "benrocks", :password_confirmation => "benrocks" }
  #      puts User.count
  #      assert_difference User.count, firstCount
  #      assert_redirected_to account_path
  #    end
  # 
  #    def should_show_user
  #      UserSession.create(users(:ben))
  #      get :show
  #      assert_response :success
  #    end
  # 
  #    def should_get_edit
  #      UserSession.create(users(:ben))
  #      get :edit, :id => users(:ben).id
  #      assert_response :success
  #    end
  # 
  #    def test_should_update_user
  #      UserSession.create(users(:ben))
  #      put :update, :id => users(:ben).id, :user => { }
  #      assert_redirected_to account_path
  #    end
end
