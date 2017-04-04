class CreateInstallments < ActiveRecord::Migration[5.0]
  def change
    create_table :installments do |t|

      t.timestamps
    end
  end
end
