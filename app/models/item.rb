class Item < ApplicationRecord

  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :customers, through: :cart_items
  # order_detailsも中間テーブルだと思ったので、新規で追加しました
  has_many :orders, through: :order_details
  has_many :cart_items

  attachment :image
  
  validates :name, presence: true, uniqueness: true
  validates :introduction, :category_id, :price, :is_active, presence: true
  
#   admin側の検索機能（ヘッダー部分）
  def Item.search(search, customer_or_item)
    if customer_or_item == "2"
    Item.where(['name LIKE ?', "%#{search}%"])
    else
    Item.all
    end
  end


end
