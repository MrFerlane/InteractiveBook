require 'test_helper'

class CharacterItemsControllerTest < ActionController::TestCase
  setup do
    @character_item = character_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_item" do
    assert_difference('CharacterItem.count') do
      post :create, character_item: { character_id: @character_item.character_id, default_item_id: @character_item.default_item_id, value: @character_item.value }
    end

    assert_redirected_to character_item_path(assigns(:character_item))
  end

  test "should show character_item" do
    get :show, id: @character_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_item
    assert_response :success
  end

  test "should update character_item" do
    patch :update, id: @character_item, character_item: { character_id: @character_item.character_id, default_item_id: @character_item.default_item_id, value: @character_item.value }
    assert_redirected_to character_item_path(assigns(:character_item))
  end

  test "should destroy character_item" do
    assert_difference('CharacterItem.count', -1) do
      delete :destroy, id: @character_item
    end

    assert_redirected_to character_items_path
  end
end
