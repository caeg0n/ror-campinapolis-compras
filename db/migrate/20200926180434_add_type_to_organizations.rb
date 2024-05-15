class AddTypeToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :type, :integer
  end
end
