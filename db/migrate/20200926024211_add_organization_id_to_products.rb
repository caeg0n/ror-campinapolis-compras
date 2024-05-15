class AddOrganizationIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :organization_id, :integer
  end
end
