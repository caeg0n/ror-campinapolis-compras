class RenameStatusToSalesmanState < ActiveRecord::Migration[6.0]
  def change
  	rename_column :orders, :status, :salesman_state
  end
end
