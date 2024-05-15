class AddUsernameToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :username, :string
  end
end
