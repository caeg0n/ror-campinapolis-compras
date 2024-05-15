class AddCategoryBaseToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :category_base, :string
  end
end
