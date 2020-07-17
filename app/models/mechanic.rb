class Mechanic < ApplicationRecord
validates_presence_of :name, :years_of_experience
has_many :rides
end
