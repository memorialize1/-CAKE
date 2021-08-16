class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      
      t.integer :customer_id,   null: false, default: "" #会員ID
      t.string  :l_name,        null: false, default: "" #宛名苗字
      t.string  :f_name,        null: false, default: "" #宛名名前
      t.string  :post_code,     null: false, default: "" #宛名郵便番号
      t.text    :address,       null: false, default: "" #宛名住所
      
      t.timestamps
    end
  end
end
