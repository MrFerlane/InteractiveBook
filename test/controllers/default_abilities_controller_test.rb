require 'test_helper'

class DefaultAbilitiesControllerTest < ActionController::TestCase
  setup do
    @default_ability = default_abilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:default_abilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create default_ability" do
    assert_difference('DefaultAbility.count') do
      post :create, default_ability: { book_id: @default_ability.book_id, description: @default_ability.description, name: @default_ability.name }
    end

    assert_redirected_to default_ability_path(assigns(:default_ability))
  end

  test "should show default_ability" do
    get :show, id: @default_ability
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @default_ability
    assert_response :success
  end

  test "should update default_ability" do
    patch :update, id: @default_ability, default_ability: { book_id: @default_ability.book_id, description: @default_ability.description, name: @default_ability.name }
    assert_redirected_to default_ability_path(assigns(:default_ability))
  end

  test "should destroy default_ability" do
    assert_difference('DefaultAbility.count', -1) do
      delete :destroy, id: @default_ability
    end

    assert_redirected_to default_abilities_path
  end
end
