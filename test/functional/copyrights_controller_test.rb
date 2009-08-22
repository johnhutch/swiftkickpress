require 'test_helper'

class CopyrightsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copyrights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copyright" do
    assert_difference('Copyright.count') do
      post :create, :copyright => { }
    end

    assert_redirected_to copyright_path(assigns(:copyright))
  end

  test "should show copyright" do
    get :show, :id => copyrights(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => copyrights(:one).id
    assert_response :success
  end

  test "should update copyright" do
    put :update, :id => copyrights(:one).id, :copyright => { }
    assert_redirected_to copyright_path(assigns(:copyright))
  end

  test "should destroy copyright" do
    assert_difference('Copyright.count', -1) do
      delete :destroy, :id => copyrights(:one).id
    end

    assert_redirected_to copyrights_path
  end
end
