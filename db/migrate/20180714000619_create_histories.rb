class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :customer_id
      t.string :nick_name
      t.string :reservation, null: false, default: "注文kgを選択"
      t.string :undispatched, null: false, default: "未発送"
      t.integer :year
      t.integer :month
      t.integer :day
      t.timestamps
    end
    add_index :histories, :reservation
  end
end
