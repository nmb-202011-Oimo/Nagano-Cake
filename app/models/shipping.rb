class Shipping < ApplicationRecord

  belongs_to :customer
  
def shipping_address
zipcode + address + name
end

  validates :name, presence: true, uniqueness: true
  validates :zipcode, presence: true
  validates :address, presence: true

end
