class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.references :user, null:false, foreign_key: true
      t.string :token, null:false
      t.timestamps
    end
  end
end
