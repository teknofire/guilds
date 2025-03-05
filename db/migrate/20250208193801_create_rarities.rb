class CreateRarities < ActiveRecord::Migration[8.0]
  def change
    create_table :rarities do |t|
      t.string :name
      t.decimal :modifier, precision: 5, scale: 2

      t.timestamps
    end
  end
end
