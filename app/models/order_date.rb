class OrderDate < ApplicationRecord
  
  belongs_to :order
  
  enum item_status: [:着手不可, :製作待ち, :製作中, :製作完了] 
  #ステータスの番号振り。左から0.1.2...と割り振られる。
  
end
