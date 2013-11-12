require 'test_helper'

class TimeControlsControllerTest < ActionController::TestCase
  setup do
    @time_control = time_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_control" do
    assert_difference('TimeControl.count') do
      post :create, time_control: { book_id: @time_control.book_id, end_time: @time_control.end_time, is_time_included: @time_control.is_time_included, started_time: @time_control.started_time }
    end

    assert_redirected_to time_control_path(assigns(:time_control))
  end

  test "should show time_control" do
    get :show, id: @time_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_control
    assert_response :success
  end

  test "should update time_control" do
    patch :update, id: @time_control, time_control: { book_id: @time_control.book_id, end_time: @time_control.end_time, is_time_included: @time_control.is_time_included, started_time: @time_control.started_time }
    assert_redirected_to time_control_path(assigns(:time_control))
  end

  test "should destroy time_control" do
    assert_difference('TimeControl.count', -1) do
      delete :destroy, id: @time_control
    end

    assert_redirected_to time_controls_path
  end
end
