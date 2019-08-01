class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false     #メールアドレス
      t.string :email_for_index, null: false
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.string :nick_name, null: false
      t.string :hashed_password
      t.timestamps
    end
    
    add_index :customers, :email_for_index, unique: true
    add_index :customers, :nick_name, unique: true
    add_index :customers, [ :family_name_kana, :given_name_kana ]
  end
end
