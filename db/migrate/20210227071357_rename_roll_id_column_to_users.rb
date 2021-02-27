class RenameRollIdColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :roll_id, :role
  end
end
