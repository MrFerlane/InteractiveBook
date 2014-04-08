require 'test_helper'

class DefaultAttributesControllerTest < ActionController::TestCase
  setup do
    @default_attribute = default_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:default_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create default_attribute" do
    assert_difference('DefaultAttribute.count') do
      post :create, default_attribute: { book_id: @default_attribute.book_id, description: @default_attribute.description, name: @default_attribute.name }
    end

    assert_redirected_to default_attribute_path(assigns(:default_attribute))
  end

  test "should show default_attribute" do
    get :show, id: @default_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @default_attribute
    assert_response :success
  end

  test "should update default_attribute" do
    patch :update, id: @default_attribute, default_attribute: { book_id: @default_attribute.book_id, description: @default_attribute.description, name: @default_attribute.name }
    assert_redirected_to default_attribute_path(assigns(:default_attribute))
  end

  test "should destroy default_attribute" do
    assert_difference('DefaultAttribute.count', -1) do
      delete :destroy, id: @default_attribute
    end

    assert_redirected_to default_attributes_path
  end
end
