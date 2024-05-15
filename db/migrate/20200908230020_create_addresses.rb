class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :device_id
      t.string :name
      t.string :cel
      t.text :address
      t.timestamps
    end
  end
end
