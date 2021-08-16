class CreateOrderDates < ActiveRecord::Migration[5.2]
  def change
    create_table :order_dates do |t|
      
      #モデルCartのデータを注文完了時にこちらへ
      
      t.integer  :order_id,    null: false, default: "" #注文番号
      t.string   :item_name,   null: false, default: "" #商品番号
      t.integer  :item_price,  null: false, default: "" #商品価格
      t.integer  :quantity,    null: false, default: "" #商品数量
      t.integer  :item_status, null: false, default: 0
      #０= 着手不可、１= 製作待ち、２= 製作中、３= 製作完了 初期値は0(着手不可)

      t.timestamps
    end
  end
end
