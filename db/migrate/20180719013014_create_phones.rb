class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.references :customer, null: false
      t.string :number, null: false, default: "0"
      t.string :number_for_index, null: false
      t.boolean :primary, null: false, default: false

      t.timestamps
    end
    
    add_index :phones, :number_for_index
    add_foreign_key :phones, :customers
  end
end
