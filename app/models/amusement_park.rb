class AmusementPark < ApplicationRecord
validates_presence_of :name, :admission_price
has_many :rides

  def thrill_average
    rides.average(:thrill_rating).round(1)
  end
end
