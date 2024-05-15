class AddPasswordToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :password, :string
  end
end
