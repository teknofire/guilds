class AddSlugToPlayer < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :slug, :string
  end
end
