require 'test_helper'

class SpectatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spectator = spectators(:one)
  end

  test "should get index" do
    get spectators_url
    assert_response :success
  end

  test "should get new" do
    get new_spectator_url
    assert_response :success
  end

  test "should create spectator" do
    assert_difference('Spectator.count') do
      post spectators_url, params: { spectator: { nombre_spectator: @spectator.nombre_spectator } }
    end

    assert_redirected_to spectator_url(Spectator.last)
  end

  test "should show spectator" do
    get spectator_url(@spectator)
    assert_response :success
  end

  test "should get edit" do
    get edit_spectator_url(@spectator)
    assert_response :success
  end

  test "should update spectator" do
    patch spectator_url(@spectator), params: { spectator: { nombre_spectator: @spectator.nombre_spectator } }
    assert_redirected_to spectator_url(@spectator)
  end

  test "should destroy spectator" do
    assert_difference('Spectator.count', -1) do
      delete spectator_url(@spectator)
    end

    assert_redirected_to spectators_url
  end
end
