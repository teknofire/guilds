class AddProviderToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :provider, :string, null: false, default: ''
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :name, :string, null: false, default: ''
  end
end
