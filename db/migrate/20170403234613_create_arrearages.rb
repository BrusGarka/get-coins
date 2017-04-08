class CreateArrearages < ActiveRecord::Migration[5.0]
  def change
    create_table :arrearages do |t|
      t.references :user, foreign_key: true, null: false
      t.references :receiver, foreign_key: true, null: false
      t.integer :payment_type, null: false, default: 0
      t.integer :category, null: false, default: 0
      t.string :title,  null: false, default: ""
      t.text :description, null: false
      t.decimal :total_value,null: false,precision: 10, scale: 2, default: 1.0
      t.integer :installment_number, null: false, default: 1
      t.boolean :paid, null:false, default: false
      t.datetime :pay_at, null:false
      t.timestamps
    end
  end
end
