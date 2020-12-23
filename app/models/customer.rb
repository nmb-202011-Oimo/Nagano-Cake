class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :cart_items


#   admin側の検索機能
  def Customer.search(search, customer_or_item)
    if customer_or_item == "1"
       Customer.where(['family_name LIKE ?', "%#{search}%"])
    else
       Customer.all
    end
  end


  validates :family_name, presence: true
  validates :first_name, presence: true
  VALID_KANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  validates :kana_family_name, presence: true, format: { with: VALID_KANA_REGEX }
  validates :kana_first_name, presence: true,  format: { with: VALID_KANA_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :zipcode, presence: true
  validates :address, presence: true
  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  # enum is_deleted: { '有効': false, '退会済': true }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
