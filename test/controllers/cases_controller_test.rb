require 'test_helper'

class CasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cases)
  end

  test "should get case to edit" do
    get :edit, id: 1
    assert_response :success
  end
end
