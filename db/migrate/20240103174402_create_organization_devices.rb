class CreateOrganizationDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_devices do |t|
      t.integer :organization_id
      t.string :device_id
      t.integer :status

      t.timestamps
    end
  end
end
