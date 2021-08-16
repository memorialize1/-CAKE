class Order < ApplicationRecord
  
  belongs_to :customer
  has_many   :order_details, dependent: :destroy
  
  enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
  enum payment: [:クレジットカード, :銀行振込]
  #ステータスの番号振り。左から0.1.2...と割り振られる。
  
  
end
