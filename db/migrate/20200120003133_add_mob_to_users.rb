class AddMobToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobilenum, :string
  end
end
