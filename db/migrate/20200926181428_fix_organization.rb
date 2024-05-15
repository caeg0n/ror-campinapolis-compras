class FixOrganization < ActiveRecord::Migration[6.0]
  def self.up
  	rename_column :organizations, :type, :organization_type
  end
end
