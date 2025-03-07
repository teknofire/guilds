class AddSlugToAshesItem < ActiveRecord::Migration[8.0]
  def change
    add_column :ashes_items, :slug, :string

    add_index :ashes_items, :slug, unique: true
  end
end
