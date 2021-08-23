class Cart < ApplicationRecord
  
  validates :quantity, presence: true
   #数量0以下に変更して保存されないように
   belongs_to :customer
   belongs_to :item
   
   
  def validate_into_cart
      cart_items = self.customer.carts
      if (quantity) == nil
        return (false)
      elsif cart_items.any? {|carts| carts.item_id == (item_id)} == true
        return (false)
      else
        return (true)
      end
  end
  
end
