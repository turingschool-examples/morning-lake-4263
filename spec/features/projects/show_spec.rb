require 'rails_helper'

RSpec.describe Project do
  describe 'user story 1' do
    describe 'when I visit /projects/:id' do
      it 'shows the project name and materials and the theme of the project challenge' do
        recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
        news_chic = recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
        upholstery_tux = furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")
        lit_fit = furniture_challenge.projects.create!(name: "Litfit", material: "Lamp")

        visit "/projects/#{lit_fit.id}"
        expect(page).to have_content("Challenge Theme: #{furniture_challenge.theme}")
        expect(page).to have_content("Material: #{lit_fit.material}")
        expect(page).to have_content("Challenge Name: #{lit_fit.name}")
      end
    end
  end
end