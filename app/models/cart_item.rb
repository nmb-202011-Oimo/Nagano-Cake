class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

def total_price #<=小計を求める,こいつが動いてくれるかわからない
		(item.price * 1.1) * quantity
end

end
