class CreateTeamShares < ActiveRecord::Migration[8.0]
  def change
    create_table :team_shares do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :shareable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
