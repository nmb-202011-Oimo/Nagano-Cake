class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy


enum payment:{
  bank: 0,
  credit: 1
} 
end
