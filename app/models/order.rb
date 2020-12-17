class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy


enum payment:{  #<=遠い未来で日本語化をします（今は仮定の日本語）
  銀行振込: 0,
  クレジットカード: 1
} 
end
