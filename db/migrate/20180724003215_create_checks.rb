class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.integer :check_year, null: false, default: 2018
      t.integer :check_month, null: false, default: 1
      t.integer :check_day, null: false, default: 1

      t.timestamps
    end
    
    add_index :checks, :check_year
    add_index :checks, :check_month
    add_index :checks, :check_day
  end
end
