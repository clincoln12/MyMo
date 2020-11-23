class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.datetime :billing
      t.string :status
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
