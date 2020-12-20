class Shipping < ApplicationRecord

  belongs_to :customer
  
def shipping_address
zipcode + address + name
end

end
