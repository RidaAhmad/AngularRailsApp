class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :access_token, :string, limit: 25, index: true
  end
end
