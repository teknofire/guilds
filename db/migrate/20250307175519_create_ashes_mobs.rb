class CreateAshesMobs < ActiveRecord::Migration[8.0]
  def change
    create_table :ashes_mobs do |t|
      t.string :slug
      t.jsonb :data

      t.timestamps
    end

    add_index :ashes_mobs, :slug, unique: true
  end
end
