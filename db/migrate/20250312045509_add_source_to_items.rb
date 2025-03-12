class AddSourceToItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :items, :source, polymorphic: true, null: true
  end
end
