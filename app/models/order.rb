class Order < ApplicationRecord

  belongs_to :customer
  has_many   :order_dates, dependent: :destroy

  enum order_status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
  enum payment: [:クレジットカード, :銀行振込]
  #ステータスの番号振り。左から0.1.2...と割り振られる。

   after_update do
    if self.order_status == "入金確認"
      self.order_dates.each {|order_date|
      order_date.update(item_status: "製作待ち")
      }
    end
  end


end
