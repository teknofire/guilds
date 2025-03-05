class AddPermissionsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :manager, :boolean
  end
end
