class AddTaskIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :task_id, :integer, null: false
  end
end
