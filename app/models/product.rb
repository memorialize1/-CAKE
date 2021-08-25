class Product < ApplicationRecord
  has_many :carts, dependent: :destroy
    has_many :ordered_products, dependent: :destroy
    validates :genre_id, presence: true
    validates :price, presence: true
    validates :description, presence: true
    validates :status, presence: true
    validates :name, presence: true




	#商品の税込み単価
    def tax_included
    	(price*1.1).round
    end

    attachment :product_image
    belongs_to :genre
end
