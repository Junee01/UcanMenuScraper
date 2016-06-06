require 'test_helper'

class UnivsControllerTest < ActionController::TestCase
  setup do
    @univ = univs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:univs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create univ" do
    assert_difference('Univ.count') do
      post :create, univ: { univ_name: @univ.univ_name }
    end

    assert_redirected_to univ_path(assigns(:univ))
  end

  test "should show univ" do
    get :show, id: @univ
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @univ
    assert_response :success
  end

  test "should update univ" do
    patch :update, id: @univ, univ: { univ_name: @univ.univ_name }
    assert_redirected_to univ_path(assigns(:univ))
  end

  test "should destroy univ" do
    assert_difference('Univ.count', -1) do
      delete :destroy, id: @univ
    end

    assert_redirected_to univs_path
  end
end
