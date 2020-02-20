require 'test_helper'

class SampleAppControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get sample_app_home_url
    assert_response :success
  end

  test "should get help" do
    get sample_app_help_url
    assert_response :success
  end

  test "should get login" do
    get sample_app_login_url
    assert_response :success
  end

end
