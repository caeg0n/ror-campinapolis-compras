require "test_helper"

class OrganizationDevicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organization_devices_index_url
    assert_response :success
  end

  test "should get create" do
    get organization_devices_create_url
    assert_response :success
  end
end
