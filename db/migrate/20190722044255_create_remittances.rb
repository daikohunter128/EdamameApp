class CreateRemittances < ActiveRecord::Migration[5.1]
  def change
    create_table :remittances do |t|
      t.string :deposit, null: false, default: "未納"
      t.string :deposit_time
      t.integer :deposit_year
      t.integer :deposit_month
      t.string :full_name
      t.string :nick_name
      t.string :prefecture
      t.integer :customer_id

      t.timestamps
    end
    add_index :remittances, :full_name
    add_index :remittances, :nick_name
    add_index :remittances, :customer_id
    add_index :remittances, :deposit
    add_index :remittances, :deposit_year
    add_index :remittances, :deposit_month
    add_index :remittances, :deposit_time
  end
end
