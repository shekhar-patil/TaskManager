class ChangeCreatorIdToBeIntegerInTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :creator_id, :integer
  end
end
