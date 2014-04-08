require 'test_helper'

class DefaultItemsControllerTest < ActionController::TestCase
  setup do
    @default_item = default_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:default_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create default_item" do
    assert_difference('DefaultItem.count') do
      post :create, default_item: { book_id: @default_item.book_id, description: @default_item.description, name: @default_item.name }
    end

    assert_redirected_to default_item_path(assigns(:default_item))
  end

  test "should show default_item" do
    get :show, id: @default_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @default_item
    assert_response :success
  end

  test "should update default_item" do
    patch :update, id: @default_item, default_item: { book_id: @default_item.book_id, description: @default_item.description, name: @default_item.name }
    assert_redirected_to default_item_path(assigns(:default_item))
  end

  test "should destroy default_item" do
    assert_difference('DefaultItem.count', -1) do
      delete :destroy, id: @default_item
    end

    assert_redirected_to default_items_path
  end
end
