class CreateAshesItems < ActiveRecord::Migration[8.0]
  def change
    create_table :ashes_items do |t|
      t.string :guid
      t.jsonb :data

      t.timestamps
    end
  end
end
