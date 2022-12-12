require 'rails_helper'

RSpec.describe 'the projects show page', type: :feature do
  let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }

  let!(:news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:upholstery_tux) { furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:lit_fit) { furniture_challenge.projects.create(name: "Litfit", material: "Lamp") }

  let!(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) {  Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:relationship) { ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:relationship_1) { ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id) }
  let!(:relationship_2) { ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id) }
  let!(:relationship_3) { ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id) }
  let!(:relationship_4) { ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id) }
  let!(:relationship_5) { ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id) }

  it 'shows that projects name, material, and theme of challenge it belongs to' do
    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("Project Name: News Chic")
    expect(page).to have_content("Material: Newspaper")
    expect(page).to have_content("Challenge Theme: Recycled Material")
    expect(page).to_not have_content("Boardfit")
    expect(page).to_not have_content("Litfit")
  end

  it 'shows a count of the number of contestants on this project' do
    visit "/projects/#{boardfit.id}"

    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Material: Cardboard Boxes")
    expect(page).to have_content("Challenge Theme: Recycled Material")

    visit "/projects/#{lit_fit.id}"

    expect(page).to have_content("Number of Contestants: 0")
  end

  it 'shows the average contestant experience on the project' do
    visit "/projects/#{news_chic.id}"
    
    expect(page).to have_content("Average Contestant Experience: 12.5 years")

    visit "/projects/#{upholstery_tux.id}"

    expect(page).to have_content("Average Contestant Experience: 10.0 years")
  end
end