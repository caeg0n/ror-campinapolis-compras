class AddDeliveryTypeToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :delivery_type, :integer
  end
end
