class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, through: :cart_items
  has_many :cart_items

  validates :family_name, presence: true, uniqueness: true
  validates :first_name, presence: true, uniqueness: true
  validates :kana_family_name, presence: true, uniqueness: true
  validates :kana_first_name, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  # enum is_deleted: { '有効': false, '退会済': true }

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
