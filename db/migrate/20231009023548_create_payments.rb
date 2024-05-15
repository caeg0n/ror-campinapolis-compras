class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :icon
      t.integer :payment_type

      t.timestamps
    end
  end
end
