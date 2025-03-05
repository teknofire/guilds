class CreateLedgers < ActiveRecord::Migration[8.0]
  def change
    create_table :ledgers do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :qty
      t.belongs_to :rarity, null: false, foreign_key: true
      t.string :action
      t.decimal :modifier, precision: 5, scale: 2
      t.integer :points

      t.timestamps
    end
  end
end
