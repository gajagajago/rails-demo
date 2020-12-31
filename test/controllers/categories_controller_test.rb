require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "sports")
    @user = User.create(name: "user", email: "usern@user.com", password: "123456", admin: false)
    @admin_user = User.create(name: "admin", email: "admin@admin.com", password: "123456", admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin_user)

    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: "travel" } }
    end

    assert_redirected_to categories_url
  end

  test "should not create category if not admin" do
    sign_in_as(@user)

    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: "travel" }}
    end

    assert_redirected_to root_path
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end
  #
  #   assert_redirected_to categories_url
  # end
end