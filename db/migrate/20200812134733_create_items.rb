class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false #名前
      t.text :explain, null: false #商品説明
      t.integer :price, null: false #商品価格
      t.references :seller, null: false, foreign_key: { to_table: :users } #売主
      t.references :buyer, foreign_key: { to_table: :users } #買主
      t.timestamps
    end
  end
end
