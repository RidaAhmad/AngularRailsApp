class AddUserNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, limit: 25, null: false
  end
end
