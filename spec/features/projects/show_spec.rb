require 'rails_helper'

RSpec.describe Project, type: :feature do
  describe 'Project show page' do
    before :each do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      
      @news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      @boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      
      @upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      @lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
      
      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)      
    end

    it 'displays project\'s name and material and I also see the theme of the challenge that this project belongs to' do
      visit "/projects/#{@boardfit.id}"

      expect(page).to have_content('Boardfit')
      expect(page).to have_content('Cardboard Boxes')
      expect(page).to have_content('Recycled Material')
    end
  end
end