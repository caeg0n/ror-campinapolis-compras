class AddMaxPriceToFeeToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :max_price_to_fee, :decimal
  end
end
