class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :orders
      t.integer :origin_id
      t.integer :deliveryman_id

      t.timestamps
    end
  end
end
