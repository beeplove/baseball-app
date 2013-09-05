require 'test_helper'

class DataControllerTest < ActionController::TestCase
  test "should get players" do
    get :players
    assert_response :success
  end

end
