class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer  :customer_id,    null: false, default: "" #会員ID
      t.string   :l_name,      null: false, default: "" #宛名苗字
      t.string   :f_name,     null: false, default: "" #宛名名前
      t.string   :post_code,      null: false, default: "" #宛名郵便番号
      t.text     :address,        null: false, default: "" #宛名住所
      t.integer  :payment,        null: false, default: "" #支払方法
      #設定 ０= クレジットカード、１= 銀行振込
      
      t.integer  :shipping,       null: false, default: 800 #送料
      t.integer  :total_price,    null: false #小計と送料の合計
      
      t.integer  :order_status,   null: false, default: 0
       # ０= 入金待ち、１= 入金確認、２= 製作中、３= 発送準備中、４= 発送済み 登録時は0(入金待ち)
      
      t.timestamps
    end
  end
end
