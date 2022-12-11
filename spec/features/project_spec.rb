require 'rails_helper'

RSpec.describe "project show page" do 
  describe 'when I visit the project show page' do 
    it 'shows the project name, material, and challenge theme' do 
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(news_chic.name)
      expect(page).to_not have_content(boardfit.name)
      expect(page).to have_content("Material: #{news_chic.material}")
      expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
    end 

    it 'shows a count of number of contestants on this project' do 
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content("Number of Contestants: 3")
    end 
  end 
end 