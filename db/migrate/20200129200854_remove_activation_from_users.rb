class RemoveActivationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :activation, :boolean
  end
end
