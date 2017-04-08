class CreateInstallments < ActiveRecord::Migration[5.0]
  def change
    create_table :installments do |t|
      t.references :arrearage, foreign_key: true, null: false
      t.integer :number, null: false, default: 1
      t.integer :month, null: false
      t.integer :year, null: false
      t.string :receipt, null: true
      t.boolean :paid, null: false, default: false
      t.decimal :value, null: false, precision: 10, scale: 2, default: 0.0
      t.datetime :pay_at, null: false
      t.datetime :paid_at, null: true
      t.timestamps
    end
  end
end
