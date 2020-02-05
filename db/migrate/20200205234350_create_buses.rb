class CreateBuses < ActiveRecord::Migration[5.0]
  def change
    create_table :buses do |t|
      t.integer :busnum

      t.timestamps
    end
  end
end
