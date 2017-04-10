class CreateReceivers < ActiveRecord::Migration[5.0]
  def change
    create_table :receivers do |t|

        t.references :user, foreing_key: true, null: false
        t.integer :category, null: false, default: 0
        t.string :name, null: true
        t.string :document, null: true
        t.integer :bank_code, null: true
        t.integer :agency,null: true
        t.integer :agency_dv, null: true
        t.integer :account,null: true
        t.integer :account_dv, null: true
        t.datetime :deleted_at, null: true

      t.timestamps
    end
  end
end
