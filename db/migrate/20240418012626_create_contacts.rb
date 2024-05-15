class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :phone_number
      t.boolean :is_deliveryman
      t.boolean :is_organization

      t.timestamps
    end
  end
end
