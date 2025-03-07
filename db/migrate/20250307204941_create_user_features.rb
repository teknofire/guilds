class CreateUserFeatures < ActiveRecord::Migration[8.0]
  def change
    create_table :user_features do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
