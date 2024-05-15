class AddDeliveryFeeToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :delivery_fee, :decimal
  end
end
