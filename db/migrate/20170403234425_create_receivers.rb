class CreateReceivers < ActiveRecord::Migration[5.0]
  def change
    create_table :receivers do |t|

        t.string :name, null: true
        t.string :document, null: true
        t.integer :bank_code, null: true
        t.integer :agency,null: true
        t.integer :agency_dv, null: true
        t.integer :account,null: true
        t.integer :account_dv, null: true

      t.timestamps
    end
  end
end
