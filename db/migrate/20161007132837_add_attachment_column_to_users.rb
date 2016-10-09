class AddAttachmentColumnToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :attachment
  end

  def down
    remove_attachment :users, :attachment
  end
end
