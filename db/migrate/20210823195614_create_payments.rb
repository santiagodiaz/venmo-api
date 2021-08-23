class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.text :description
      t.references :recipient, class_name: 'User', index: true, null: false
      t.references :sender, class_name: 'User', index: true, null: false

      t.timestamps
    end
  end
end
