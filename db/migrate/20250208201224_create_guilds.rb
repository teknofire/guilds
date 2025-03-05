class CreateGuilds < ActiveRecord::Migration[8.0]
  def change
    create_table :guilds do |t|
      t.string :name
      t.belongs_to :parent_guild, null: true, foreign_key: { to_table: :guilds }

      t.timestamps
    end
  end
end
