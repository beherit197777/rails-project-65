# frozen_string_literal: true

require 'test_helper'

class Web::Admin::BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regular_user = users(:one)
    @admin_user = users(:admin)
    @drafted_bulletin = bulletins(:drafted)
    @under_moderation_bulletin = bulletins(:under_moderation)
    @published_bulletin = bulletins(:published)
  end

  test 'should get index when admin' do
    sign_in @admin_user

    get admin_root_path

    assert_response :success
  end

  test 'should publish bulletin when admin' do
    sign_in @admin_user

    patch publish_admin_bulletin_url(@under_moderation_bulletin)

    assert @under_moderation_bulletin.reload.published?
  end

  test 'should reject bulletin when admin' do
    sign_in @admin_user

    patch reject_admin_bulletin_url(@under_moderation_bulletin)

    assert @under_moderation_bulletin.reload.rejected?
  end

  test 'should archive bulletin when admin' do
    sign_in @admin_user

    patch archive_admin_bulletin_url(@under_moderation_bulletin)

    assert @under_moderation_bulletin.reload.archived?
  end

  test 'should not publish drafted bulletin when admin' do
    sign_in @admin_user

    patch publish_admin_bulletin_url(@drafted_bulletin)

    assert_redirected_to admin_bulletins_url
  end
end
