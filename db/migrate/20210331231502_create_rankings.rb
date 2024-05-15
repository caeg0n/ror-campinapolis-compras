class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.references :organization, null: false, foreign_key: true
      t.integer :hearts
      t.integer :hearts_votes
      t.integer :stars
      t.integer :star_votes

      t.timestamps
    end
  end
end
