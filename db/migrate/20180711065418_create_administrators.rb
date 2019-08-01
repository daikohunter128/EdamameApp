class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :email, null: false     #メールアドレス
      t.string :email_for_index, null: false
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.string :hashed_password
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :suspended, null: false, default: false
      t.string :stock, null: false, default: "売り切れ"

      t.timestamps
    end
    add_index :administrators, :email_for_index, unique: true
    add_index :administrators, [ :family_name_kana, :given_name_kana ]
  end
end
