class AddCreatorIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :creator_id, :string
  end
end
