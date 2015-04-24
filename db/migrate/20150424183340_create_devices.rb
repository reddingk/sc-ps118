class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :dev_type
      t.integer :userid

      t.timestamps null: false
    end
  end
end
