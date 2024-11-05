# frozen_string_literal: true

class Web::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get show" do
    sign_in @user
    get profile_path
    assert_response :success
  end
  test "should get index when user is logged in" do
    sign_in(@user)
    get profile_path

    assert_response :success
  end
end
