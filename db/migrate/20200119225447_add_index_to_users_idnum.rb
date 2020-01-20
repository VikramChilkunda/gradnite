class AddIndexToUsersIdnum < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :idnum, unique: true
  end
end
