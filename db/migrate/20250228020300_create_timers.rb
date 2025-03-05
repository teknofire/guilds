class CreateTimers < ActiveRecord::Migration[8.0]
  def change
    create_table :timers do |t|
      t.string :name
      t.datetime :starts_at
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :public
      t.text :description

      t.timestamps
    end
  end
end
