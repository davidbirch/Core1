class CreateOrderTransactions < ActiveRecord::Migration
  def change
    create_table :order_transactions do |t|
      t.integer :order_id
      t.string :action
      t.integer :amount
      
      t.string :response_success
      t.string :response_authorization
      t.string :response_message
  
      t.boolean :trxn_status
      t.string :trxn_number
      t.string :trxn_reference
      t.string :trxn_option_1
      t.string :trxn_option_2
      t.string :trxn_option_3
      t.string :auth_code
      t.integer :return_amount
      t.string :trxn_error
      t.text :params

      t.timestamps
    end
  end
end
