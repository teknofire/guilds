class SetDefaultTimezoneToNilUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :timezone, nil
  end
end
