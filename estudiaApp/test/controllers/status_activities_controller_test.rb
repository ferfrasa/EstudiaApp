require 'test_helper'

class StatusActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_activity = status_activities(:one)
  end

  test "should get index" do
    get status_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_status_activity_url
    assert_response :success
  end

  test "should create status_activity" do
    assert_difference('StatusActivity.count') do
      post status_activities_url, params: { status_activity: { nombre_status_activity: @status_activity.nombre_status_activity } }
    end

    assert_redirected_to status_activity_url(StatusActivity.last)
  end

  test "should show status_activity" do
    get status_activity_url(@status_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_activity_url(@status_activity)
    assert_response :success
  end

  test "should update status_activity" do
    patch status_activity_url(@status_activity), params: { status_activity: { nombre_status_activity: @status_activity.nombre_status_activity } }
    assert_redirected_to status_activity_url(@status_activity)
  end

  test "should destroy status_activity" do
    assert_difference('StatusActivity.count', -1) do
      delete status_activity_url(@status_activity)
    end

    assert_redirected_to status_activities_url
  end
end
