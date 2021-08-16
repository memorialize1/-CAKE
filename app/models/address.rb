class Address < ApplicationRecord
  
  validates :l_name,  presence: true
  validates :f_name, presence: true
  validates :post_code,  presence: true, format: {with: /\A\d{7}\z/}
  # 郵便番号ハイフン無し７桁固定
  validates :address, presence: true
  
  belongs_to :customer
  
end
