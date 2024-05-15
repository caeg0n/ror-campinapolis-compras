class AddOpenToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :open, :boolean
  end
end
