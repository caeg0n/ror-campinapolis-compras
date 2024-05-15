class AddDeliveryStateToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :delivery_state, :integer
  end
end
