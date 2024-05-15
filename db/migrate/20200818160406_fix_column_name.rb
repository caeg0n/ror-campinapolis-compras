class FixColumnName < ActiveRecord::Migration[6.0]
  def self.up 
    rename_column :products, :type, :category  
  end  
end
