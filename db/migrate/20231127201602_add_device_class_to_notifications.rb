class AddDeviceClassToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :device_class, :integer
  end
end
