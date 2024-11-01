# frozen_string_literal: true

class Web::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should not get index" do
    get profile_profiles_path

    assert_redirected_to root_url
  end

  test "should get index when user is logged in" do
    sign_in(@user)
    get profile_profiles_path

    assert_response :success
  end
end
