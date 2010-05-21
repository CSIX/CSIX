require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  fixtures :roles
  
  def test_should_be_vaild
    assert roles(:admin).valid?
    assert roles(:user).valid?
  end
end
