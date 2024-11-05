# frozen_string_literal: true

require 'test_helper'

class Web::Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regular_user = users(:one)
    @category = categories(:one)
    @admin_user = users(:admin)
    @empty_category = categories(:empty)
    @update_params = { category: { name: 'New name' } }
    @create_params = { category: { name: 'New category' } }
  end

  test 'should get index when admin' do
    sign_in @admin_user

    get admin_categories_url

    assert_response :success
  end

  test 'should get new when admin' do
    sign_in @admin_user

    get new_admin_category_url

    assert_response :success
  end

  test 'should create category when admin' do
    sign_in @admin_user

    post admin_categories_url, params: @create_params
    assert Category.exists?(name: @create_params[:category][:name])
  end

  test 'should get edit when admin' do
    sign_in @admin_user

    get edit_admin_category_path(@category)

    assert_response :success
  end

  test 'should update category when admin' do
    sign_in @admin_user

    patch admin_category_url(@category), params: @update_params
    assert @category.reload.name == @update_params[:category][:name]
  end

  # test 'should not delete not empty category when admin' do
  #   sign_in @admin_user
  #
  #   delete admin_category_url(@category)
  #   assert Category.exists?(@category.id)
  # end

  test 'should not delete not empty category when admin' do
    sign_in users(:admin)

    category_with_bulletin = categories(:one)

    assert_no_difference('Category.count') do
      delete admin_category_url(category_with_bulletin)
    end

    assert Category.exists?(category_with_bulletin.id)
    assert_redirected_to admin_categories_path
    assert_equal I18n.t('web.admin.categories.destroy.cannot_delete'), flash[:alert]
  end

  test 'should delete empty category when admin' do
    sign_in @admin_user

    delete admin_category_url(@empty_category)
    assert_not Category.exists?(@empty_category.id)
  end
end
