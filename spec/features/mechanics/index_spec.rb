require "rails_helper"
# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# Ex:
#              All Mechanics
#    Sam Mills - 10 years of experience
#    Kara Smith - 11 years of experience

RSpec.describe "Mechanics Index page" do
  it "shows all mechanics with names and years_of_experience" do
    sam = Mechanic.create(name: "Sam Mills", years_of_experience: 10)
    kara = Mechanic.create(name: "Kara Smith", years_of_experience: 11)

    visit "/mechanics"

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content("Kara Smith - 11 years of experience")
    expect(page).to have_content("Sam Mills - 10 years of experience")


  end

end
