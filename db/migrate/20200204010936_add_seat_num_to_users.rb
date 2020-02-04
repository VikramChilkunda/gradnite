class AddSeatNumToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :seatnum, :integer
  end
end
