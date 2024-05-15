class AddTokenToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :token, :string
  end
end
