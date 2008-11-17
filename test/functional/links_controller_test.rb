require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create links" do
    assert_difference('Links.count') do
      post :create, :links => { }
    end

    assert_redirected_to links_path(assigns(:links))
  end

  test "should show links" do
    get :show, :id => links(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => links(:one).id
    assert_response :success
  end

  test "should update links" do
    put :update, :id => links(:one).id, :links => { }
    assert_redirected_to links_path(assigns(:links))
  end

  test "should destroy links" do
    assert_difference('Links.count', -1) do
      delete :destroy, :id => links(:one).id
    end

    assert_redirected_to links_path
  end
end
