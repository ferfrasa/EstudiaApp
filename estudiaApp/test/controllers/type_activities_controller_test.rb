require 'test_helper'

class TypeActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_activity = type_activities(:one)
  end

  test "should get index" do
    get type_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_type_activity_url
    assert_response :success
  end

  test "should create type_activity" do
    assert_difference('TypeActivity.count') do
      post type_activities_url, params: { type_activity: { nombre_type_activity: @type_activity.nombre_type_activity } }
    end

    assert_redirected_to type_activity_url(TypeActivity.last)
  end

  test "should show type_activity" do
    get type_activity_url(@type_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_activity_url(@type_activity)
    assert_response :success
  end

  test "should update type_activity" do
    patch type_activity_url(@type_activity), params: { type_activity: { nombre_type_activity: @type_activity.nombre_type_activity } }
    assert_redirected_to type_activity_url(@type_activity)
  end

  test "should destroy type_activity" do
    assert_difference('TypeActivity.count', -1) do
      delete type_activity_url(@type_activity)
    end

    assert_redirected_to type_activities_url
  end
end
