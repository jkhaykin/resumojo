require 'test_helper'

class ResuploadsControllerTest < ActionController::TestCase
  setup do
    @resupload = resuploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resuploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resupload" do
    assert_difference('Resupload.count') do
      post :create, resupload: { user_id: @resupload.user_id }
    end

    assert_redirected_to resupload_path(assigns(:resupload))
  end

  test "should show resupload" do
    get :show, id: @resupload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resupload
    assert_response :success
  end

  test "should update resupload" do
    patch :update, id: @resupload, resupload: { user_id: @resupload.user_id }
    assert_redirected_to resupload_path(assigns(:resupload))
  end

  test "should destroy resupload" do
    assert_difference('Resupload.count', -1) do
      delete :destroy, id: @resupload
    end

    assert_redirected_to resuploads_path
  end
end
