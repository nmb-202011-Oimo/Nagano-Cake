class OrderDetail < ApplicationRecord

  belongs_to :order_detail
  belongs_to :order

end
