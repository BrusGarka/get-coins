class CreateMonthlyIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :monthly_incomes do |t|
      t.references :user, foreing_key: true, null: false
      t.integer :month, null: false, defaut: 0
      t.decimal :value, null: false, default: 1.0
      t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
