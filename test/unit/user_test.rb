require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users, :roles
  
  def setup
    @user = User.create!(:username => "tester", :email => "tester@test.com", :password => "test", :password_confirmation => "test", :role_id => Role.find_by_name("user").id)
  end
  
  def test_should_be_valid
    assert users(:admin).valid?
    assert users(:user).valid?
  end
  
  def test_should_have_role
    assert !users(:admin).role.nil?
    assert !users(:user).role.nil?
    assert !@user.role.nil?
  end
  
  def test_should_have_correct_role
    assert users(:admin).role.eql? roles(:admin)
    assert users(:user).role.eql? roles(:user)
    assert @user.role.eql? roles(:user)
  end
  
end