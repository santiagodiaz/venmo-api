class CreatePaymentAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_accounts do |t|
      t.float :balance, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
