require 'test_helper'

class PostcardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postcards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postcard" do
    assert_difference('Postcard.count') do
      post :create, :postcard => { }
    end

    assert_redirected_to postcard_path(assigns(:postcard))
  end

  test "should show postcard" do
    get :show, :id => postcards(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => postcards(:one).id
    assert_response :success
  end

  test "should update postcard" do
    put :update, :id => postcards(:one).id, :postcard => { }
    assert_redirected_to postcard_path(assigns(:postcard))
  end

  test "should destroy postcard" do
    assert_difference('Postcard.count', -1) do
      delete :destroy, :id => postcards(:one).id
    end

    assert_redirected_to postcards_path
  end
end
