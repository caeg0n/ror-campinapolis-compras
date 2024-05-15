class AddCoverToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :cover, :string
  end
end
