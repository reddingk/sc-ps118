require 'test_helper'

class GeraldControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get arnold" do
    get :arnold
    assert_response :success
  end

  test "should get sid" do
    get :sid
    assert_response :success
  end

end
