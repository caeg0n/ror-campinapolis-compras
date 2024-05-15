class CreateOrganizationCategoryTags < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_category_tags do |t|
      t.integer :organization_id
      t.integer :tag

      t.timestamps
    end
  end
end
