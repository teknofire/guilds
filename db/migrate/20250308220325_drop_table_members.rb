class DropTableMembers < ActiveRecord::Migration[8.0]
  def up
    drop_table :members
  end

  def down 
    raise ActiveRecord::IrreversibleMigration, "Can't recover the dropped table members"
  end
end
