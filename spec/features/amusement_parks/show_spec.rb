require 'rails_helper'

# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10

RSpec.describe "Amusement Park show page" do
  it "displays the name, admission_price, rides in alphabetical order, and average thrill_rating" do
    hershey_park = AmusementPark.create(name: "Hershey Park", admission_price: 50)
    lightning_racer = Ride.create(name: "Lightning Racer", thrill_rating: 1, amusement_park: hershey_park)
    storm_runner = Ride.create(name: "Storm Runner", thrill_rating: 5, amusement_park: hershey_park)
    the_great_bear = Ride.create(name: "The Great Bear", thrill_rating: 10, amusement_park: hershey_park)

    visit "/amusement_parks/#{hershey_park.id}"
    save_and_open_page

    expect(page).to have_content("#{hershey_park.name}")
    expect(page).to have_content("#{hershey_park.admission_price}")
    expect(page).to have_content("1. Lightning Racer")
    expect(page).to have_content("2. Storm Runner")
    expect(page).to have_content("3. The Great Bear")
    expect(page).to have_content("Average Thrill Rating of Rides: 5.3/10")
  end
end
