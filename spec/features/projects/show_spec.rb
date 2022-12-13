require 'rails_helper'
# User Story 1 of 3

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)


RSpec.describe 'projects show page' do
  describe 'As a visitor' do
    describe 'when I visit a projects show page "/projects/:id"' do
      before :each do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
        visit "/projects/#{@lit_fit.id}"
      end
      it 'I see that projects name and material' do
        expect(page).to have_content("#{@lit_fit.name}")
        expect(page).to have_content("#{@lit_fit.material}")
      end

      it 'And I also see the them of the challenge that this project belongs to' do
        expect(page).to have_content("#{@furniture_challenge.theme}")
        save_and_open_page
      end
    end
  end
end