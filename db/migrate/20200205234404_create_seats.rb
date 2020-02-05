class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.integer :seatnum
      t.integer :bus_id
      t.bus :references

      t.timestamps
    end
  end
end
