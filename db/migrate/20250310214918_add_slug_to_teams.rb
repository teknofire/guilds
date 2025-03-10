class AddSlugToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :slug, :string
  end
end
