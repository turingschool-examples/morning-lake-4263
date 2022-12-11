require 'rails_helper'

# As a visitor,
# When I visit the contestants index page ("/contestants")
# I see a list of names of all the contestants
# And under each contestants name I see a list of the projects (names) that they've been on

# (e.g.   Kentaro Kameyama
#         Projects: Litfit, Rug Tuxedo

#         Jay McCarroll
#         Projects: LeatherFeather)

RSpec.describe 'Contestants Index page' do
  describe 'User story 2' do
    it 'can see a list of all contestant names' do
      jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      visit '/contestants'

      expect(page).to have_content(jay.name)
      expect(page).to have_content(gretchen.name)
      expect(page).to have_content(kentaro.name)
    end
  end
end