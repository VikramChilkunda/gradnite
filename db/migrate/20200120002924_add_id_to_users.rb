class AddIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :idnum, :string
  end
end
