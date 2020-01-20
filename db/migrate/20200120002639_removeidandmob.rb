class Removeidandmob < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :idnum
    remove_column :users, :mobilenum
  end
end
