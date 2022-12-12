require 'rails_helper'

RSpec.describe 'contestants index' do
  it 'lists all contestant names and the prjects they have been on' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)

    visit '/contestants'

    within("div##{ jay.id }") do
      expect(page).to have_content(jay.name)
      jay.projects.each do |project|
        expect(page).to have_content(project.name)
      end
    end    

    within("div##{ gretchen.id }") do
      expect(page).to have_content(gretchen.name)
      gretchen.projects.each do |project|
        expect(page).to have_content(project.name)
      end
    end    
    
    within("div##{ kentaro.id }") do
      expect(page).to have_content(kentaro.name)
      kentaro.projects.each do |project|
        expect(page).to have_content(project.name)
      end
    end
  end
end
