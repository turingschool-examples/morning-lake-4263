require 'rails_helper'
require 'test_helper'

RSpec.describe "Contestants Index Page" do
  before :each do
    seed_challenges
    seed_projects
    seed_contestants
    seed_contestant_projects
  end

  describe "User visits '/contestants'" do
    it 'lists all contestants and their projects' do
      visit "/contestants"

      expect(page).to have_content(@jay.name)
      within("#contestant-#{@jay.id}") do
        expect(page).to have_content("News Chic")
      end

      expect(page).to have_content(@gretchen.name)
      within("#contestant-#{@gretchen.id}") do
        expect(page).to have_content("News Chic")
        expect(page).to have_content("Upholstery Tuxedo")
      end

      expect(page).to have_content(@kentaro.name)
      within("#contestant-#{@kentaro.id}") do
        expect(page).to have_content("Upholstery Tuxedo")
        expect(page).to have_content("Boardfit")
      end

      expect(page).to have_content(@erin.name)
      within("#contestant-#{@erin.id}") do
        expect(page).to have_content("Boardfit")
      end
    end
  end
end