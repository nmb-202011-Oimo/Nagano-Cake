class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :cart_items

  
  def Customer.search(search, customer_or_item)
    if customer_or_item == "1"
       Customer.where(['family_name LIKE ?', "%#{search}%"])
    else
       Customer.all
    end
  end

  # enum is_deleted: { '有効': false, '退会済': true }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
