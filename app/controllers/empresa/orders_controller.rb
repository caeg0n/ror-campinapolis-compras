module Empresa
  class OrdersController < ApplicationController
    include ResponseHandler

    def get_orders_by_organization
      uuid = get_orders_by_organization_params[:uuid]
      organization_id = get_orders_by_organization_params[:organization_id].to_i
      auth = OrganizationDevice.find_by(device_id: uuid).status
      if organization_id > 0 and auth == "enabled"
        grouped_orders = Order.all.group_by(&:reference)
        enriched_grouped_orders = grouped_orders.transform_values do |orders|
          enriched_orders = orders.map do |order|
            product = Product.find_by(id: order.product_id)
            organization = Organization.find_by(id: product&.organization_id)
            order_attributes = order.attributes
            order_attributes["organization_id"] = product&.organization_id
            order_attributes["organization_name"] = organization&.name
            order_attributes["organization_logo"] = organization&.logo
            order_attributes["organization_category"] = organization&.category_base
            order_attributes["data"] = I18n.l(Time.current, format: :long)
            order_attributes
          end
          enriched_orders.group_by { |order| order["organization_id"] }
        end
        return render_json_response(obj:enriched_grouped_orders, state: ResponseHandler::STATES[:success])
      else
        return render_json_response(state: ResponseHandler::STATES[:not_authorized])
      end
    end

  private

    def get_orders_by_organization_params
      params.permit(:uuid, :organization_id, :format)
    end

  end
end
