require 'test_helper'

class AboutControllerTest < ActionController::TestCase

  # Make sure the index actions is displayed when called
  def test_should_get_index
    get :index
    assert_response :success
  end 
  
end
