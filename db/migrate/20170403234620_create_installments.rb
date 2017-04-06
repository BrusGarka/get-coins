class CreateInstallments < ActiveRecord::Migration[5.0]
  def change
    create_table :installments do |t|
      t.references :arrearage, foreign_key: true, null: false
      t.integer :number, null: false, default: 1
      t.string :receipt, null: true
      t.boolean :payd, null: false, default: false
      t.decimal :value, null: false, precision: 10, scale: 2, default: 0.0
      t.datetime :pay_at, null: false
      t.datetime :payd_at, null: true
      t.timestamps
    end
  end
end
