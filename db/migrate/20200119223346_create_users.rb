class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :idnum
      t.integer :mobilenum

      t.timestamps
    end
  end
end
