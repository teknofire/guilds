class CreateTimerLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :timer_logs do |t|
      t.belongs_to :timer, null: false, foreign_key: true
      t.belongs_to :updated_by, null: false, foreign_key: { to_table: :users }
      t.datetime :previous_starts_at
      t.string :message

      t.timestamps
    end
  end
end
