class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :device
      t.string :token

      t.timestamps
    end
  end
end
