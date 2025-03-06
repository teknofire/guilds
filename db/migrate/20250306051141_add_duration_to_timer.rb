class AddDurationToTimer < ActiveRecord::Migration[8.0]
  def change
    add_column :timers, :duration, :integer
  end
end
