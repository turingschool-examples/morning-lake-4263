require 'rails_helper'
# User Story 1 of 3

# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)

# User Story 3 of 3
# As a visitor,
# When I visit a project's show page
# I see a count of the number of contestants on this project

# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings
#   Number of Contestants: 3 )
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

        @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
        @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)


        ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
        ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
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