class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total
      t.integer :quantity
      t.integer :product_id
      t.integer :user_id
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
