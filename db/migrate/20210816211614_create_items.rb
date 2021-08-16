class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer  :genre_id,    index: true, null: false, default: "" #外部キー 商品ジャンルのID
      t.string   :image_id #商品画像ID
      t.string   :name,        null: false, default: "" #商品名
      t.text     :introduction #商品説明
      t.integer  :price,       null: false, default: "" #価格
      t.integer  :sale_status, null: false, default: 1 #設定 ０ = 販売可、１ = 販売不可　登録時は販売不可
      

      t.timestamps
    end
  end
end
