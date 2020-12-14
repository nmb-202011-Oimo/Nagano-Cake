class Item < ApplicationRecord

  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :cart_items


end
