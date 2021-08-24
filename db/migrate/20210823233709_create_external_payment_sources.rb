class CreateExternalPaymentSources < ActiveRecord::Migration[6.0]
  def change
    create_table :external_payment_sources do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
