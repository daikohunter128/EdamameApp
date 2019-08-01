class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :customer, null: false               # 顧客への外部キー
      t.string :postal_code, null: false                # 郵便番号
      t.string :prefecture, null: false                 # 都道府県
      t.string :city, null: false                       # 市区町村
      t.string :address1, null: false                   # 町域、番地等
      t.string :address2, null: false                   # 建物名、部屋番号等

      t.timestamps
    end
    
    add_index :addresses, :address1
    add_foreign_key :addresses, :customers
  end
end
