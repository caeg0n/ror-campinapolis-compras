class AddOrganizationStatusToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :organization_status, :integer
  end
end
