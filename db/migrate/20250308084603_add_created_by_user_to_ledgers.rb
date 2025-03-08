class AddCreatedByUserToLedgers < ActiveRecord::Migration[8.0]
  def change
    add_reference :ledgers, :created_by, null: false, foreign_key: { to_table: :users }
  end
end
