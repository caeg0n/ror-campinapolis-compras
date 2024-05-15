class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :cel
      t.string :logo

      t.timestamps
    end
  end
end
