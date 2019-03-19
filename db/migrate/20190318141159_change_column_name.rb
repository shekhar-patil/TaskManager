class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :user_id, :assignee_id
  end
end
