require 'test_helper'

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery = deliveries(:one)
  end

  test "should get index" do
    get deliveries_url, as: :json
    assert_response :success
  end

  test "should create delivery" do
    assert_difference('Delivery.count') do
      post deliveries_url, params: { delivery: { deliveryman_id: @delivery.deliveryman_id, orders: @delivery.orders, origin_id: @delivery.origin_id } }, as: :json
    end

    assert_response 201
  end

  test "should show delivery" do
    get delivery_url(@delivery), as: :json
    assert_response :success
  end

  test "should update delivery" do
    patch delivery_url(@delivery), params: { delivery: { deliveryman_id: @delivery.deliveryman_id, orders: @delivery.orders, origin_id: @delivery.origin_id } }, as: :json
    assert_response 200
  end

  test "should destroy delivery" do
    assert_difference('Delivery.count', -1) do
      delete delivery_url(@delivery), as: :json
    end

    assert_response 204
  end
end
