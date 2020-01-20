class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :mobilenum, unique: true
  end
end
