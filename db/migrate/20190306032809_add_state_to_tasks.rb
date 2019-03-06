class AddStateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :state, :integer, default: "open"
  end
end
