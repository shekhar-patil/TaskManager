class AddForeignKeyToTask < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tasks, :users, on_delete: :cascade
  end
end
