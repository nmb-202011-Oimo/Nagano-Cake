class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

enum product_status:{
  "制作不可": 0,
  "制作待ち": 1,
  "製作中": 2,
  "制作完了": 3
}



def total_price
  price * quantity
end
end
