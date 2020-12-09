class AddCreditCardIdToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :credit_card_id, :integer
  end
end
