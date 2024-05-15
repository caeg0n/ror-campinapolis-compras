class MinimalBuyPriceToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :minimal_buy_price, :decimal
  end
end
