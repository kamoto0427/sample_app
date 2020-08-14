class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :item, null:false
      t.integer :photo,   null:false
      t.timestamps
    end
  end
end
