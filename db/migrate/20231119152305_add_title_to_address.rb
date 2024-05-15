class AddTitleToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :title, :string
  end
end
