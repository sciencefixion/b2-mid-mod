class AmusementPark < ApplicationRecord
validates_presence_of :name, :addmission_price
has_many :rides
end
