require 'test_helper'

class LabelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labels)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_nil assigns(:errors)
    assert_not_nil assigns(:label)
  end
end
