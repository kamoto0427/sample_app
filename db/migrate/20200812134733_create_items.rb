class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false #名前
      t.text :explain, null: false #商品説明
      t.references :category#カテゴリー カテゴリー機能追加後、nullと外部キー設定要
      t.text :brand #ブランド名
      t.references :state, null: false #商品状態
      t.references :shipping_burden, null: false #送料負担
      t.references :reservation_email, null: false #発送方法
      t.references :prefecture, null: false #発送地域
      t.references :shipping_day, null: false #発送までの日数
      t.integer :price, null: false #商品価格
      t.references :seller, null: false, foreign_key: { to_table: :users } #売主
      t.references :buyer, foreign_key: { to_table: :users } #買主
      t.timestamps
    end
  end
end
