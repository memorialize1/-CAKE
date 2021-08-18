class Item < ApplicationRecord


  #バリデーションについて
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, 		  presence: true
  validates :sale_status, presence: true



  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  attachment :image
  enum sale_status: [:販売可, :販売不可]
  #ステータスの番号振り。左から0.1.2...と割り振られる。

end
