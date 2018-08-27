require 'test_helper'

class CategoryAsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_a = category_as(:one)
  end

  test "should get index" do
    get category_as_url
    assert_response :success
  end

  test "should get new" do
    get new_category_a_url
    assert_response :success
  end

  test "should create category_a" do
    assert_difference('CategoryA.count') do
      post category_as_url, params: { category_a: { color: @category_a.color, name: @category_a.name } }
    end

    assert_redirected_to category_a_url(CategoryA.last)
  end

  test "should show category_a" do
    get category_a_url(@category_a)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_a_url(@category_a)
    assert_response :success
  end

  test "should update category_a" do
    patch category_a_url(@category_a), params: { category_a: { color: @category_a.color, name: @category_a.name } }
    assert_redirected_to category_a_url(@category_a)
  end

  test "should destroy category_a" do
    assert_difference('CategoryA.count', -1) do
      delete category_a_url(@category_a)
    end

    assert_redirected_to category_as_url
  end
end
