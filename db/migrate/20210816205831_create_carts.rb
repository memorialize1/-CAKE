class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      
      t.integer :customer_id, null: false, default: "" #会員ID
      t.integer :item_id, null: false, default: "" #商品ID
      t.integer :quantity, null: false, default: "" #商品の数量

      t.timestamps
    end
  end
end
