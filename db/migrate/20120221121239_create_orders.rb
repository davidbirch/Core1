class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total_amount, precision: 8, scale: 2
      t.string :first_name
      t.string :last_name
      t.date :card_expires_on

      t.timestamps
    end
  end
end
