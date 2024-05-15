require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get save" do
    get contact_save_url
    assert_response :success
  end
end
