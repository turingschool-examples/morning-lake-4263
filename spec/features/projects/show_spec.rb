require 'rails_helper'

RSpec.describe 'the projects show page' do
  describe 'as a visitor' do
    describe 'I visit a projects show page' do
      it 'I see that projects name and material' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content(news_chic.name)
        expect(page).to have_content("Material: #{news_chic.material}")
      end

      it 'I see the theme of the challenge that this project belongs to' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        visit "/projects/#{news_chic.id}"
        expect(page).to have_content("Challenge Theme: #{news_chic.challenge.theme}")
      end

      # As a visitor,
      # When I visit a project's show page
      # I see a count of the number of contestants on this project

      # (e.g.    Litfit
      #     Material: Lamp Shade
      #     Challenge Theme: Apartment Furnishings
      #     Number of Contestants: 3 )
      it 'I see a count of the number of contestants on this projet' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: 'Gretchen Jones', age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content('Number of Contestants: 2')
      end
    end
  end
end
