class AddCoordinatesToTimer < ActiveRecord::Migration[8.0]
  def change
    add_column :timers, :coord_x, :decimal, precision: 20, scale: 6
    add_column :timers, :coord_y, :decimal, precision: 20, scale: 6
  end
end
