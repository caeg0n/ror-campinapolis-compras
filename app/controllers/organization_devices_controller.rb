class OrganizationDevicesController < ApplicationController
  
  def find
    if find_organization_device_params["device_id"].present?
      device_id = find_organization_device_params["device_id"]
      device = OrganizationDevice.enabled.where(device_id:device_id)
      organization = Organization.find(device[0].organization_id) if device.count > 0
      filtered_organization = organization.attributes.slice("name","cover","logo", "delivery_type", "minimal_buy_price","delivery_fee") if device.count > 0
      filtered_organization["delivery_type"] = :my_org if filtered_organization["delivery_type"].nil? if device.count > 0
      return render json: {device:device[0].id, status:1, organization:filtered_organization}, status: :ok if device.count > 0 
      device = OrganizationDevice.disabled.where(device_id:device_id)
      return render json: {device:device[0].id, status:2}, status: :ok if device.count > 0 
      if not device.count > 0
        organization_device = OrganizationDevice.new
        organization_device.device_id = device_id
        organization_device.status = :disabled
        organization_device.save
        return render json: {device:organization_device.id, status:2}, status: :created
      end
    else
      return render json: "error", status: :unprocessable_entity #422
    end
  end

  def update_fees
    uuid = update_fees_params["uuid"]
    minimal_order_value = update_fees_params["minimal_order_value"]
    delivery_fee = update_fees_params["delivery_fee"]
    device = OrganizationDevice.enabled.where(device_id:uuid)
    organization = Organization.find(device[0].organization_id) if device.count > 0
    organization.minimal_buy_price = minimal_order_value if device.count > 0
    organization.delivery_fee = delivery_fee if device.count > 0
    organization.save if device.count > 0
    return render json: "ok", status: :ok if device.count > 0
    return render json: "error", status: :unprocessable_entity #422
  end


  def validate_device
    uuid = validade_device_params[:uuid]
    organization = OrganizationDevice.where(device_id:uuid);
    return render json: {organization:organization.first}, status: :ok if organization.count > 0
    return render json: "error", status: :unprocessable_entity
  end


private

  def validade_device_params
    params.require(:organization_device).permit(:uuid)
  end

  def update_fees_params
    params.require(:organization_device).permit(:uuid,:minimal_order_value,:delivery_fee)
  end

  def find_organization_device_params
    params.require(:organization_device).permit(:device_id)
  end

  def create_organization_device_params
    params.require(:organization_device).permit(:device_id, :organization_id, :organization_device_type)
  end
end
