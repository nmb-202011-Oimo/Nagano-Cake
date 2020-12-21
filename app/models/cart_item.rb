class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item


def subtotal_price #<=小計を求める,こいつが動いてくれるかわからない
  tax_price * quantity.to_i
end
 
 def tax_price
     item.price * 1.1
 end
end
