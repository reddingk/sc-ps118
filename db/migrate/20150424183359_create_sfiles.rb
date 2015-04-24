class CreateSfiles < ActiveRecord::Migration
  def change
    create_table :sfiles do |t|
      t.string :name
      t.integer :userid
      t.integer :devid
      t.string :syncfile

      t.timestamps null: false
    end
  end
end
