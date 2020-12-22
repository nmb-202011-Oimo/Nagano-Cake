class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

validates :zipcode, presence: true
validates :address, presence: true
validates :name, presence: true


enum payment:{  #<=遠い未来で日本語化をします（今は仮定の日本語）
  "銀行振込": 0,
  "クレジットカード": 1
} 

enum status:{
  "入金待ち": 0,
  "入金確認": 1,
  "製作中": 2,
  "発送準備": 3,
  "発送済み": 4
}
end
