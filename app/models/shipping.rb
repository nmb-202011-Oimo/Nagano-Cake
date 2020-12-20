class Shipping < ApplicationRecord

  belongs_to :customer

  validates :name, presence: true, uniqueness: true
  validates :zipcode, presence: true
  validates :address, presence: true

end
