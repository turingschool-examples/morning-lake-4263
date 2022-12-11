# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
require 'rails_helper'

RSpec.describe 'The project show page' do
  it 'displays a projects name, material, and theme' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content(news_chic.name)
    expect(page).to have_content("Material: #{news_chic.material}")
    expect(page).to have_content("Challenge Theme: #{recycled_material_challenge.theme}")
  end
  # As a visitor,
  # When I visit a project's show page
  # I see a count of the number of contestants on this project

  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings
  #   Number of Contestants: 3 )
  it 'displays a count of the number of contestants on the show page' do
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: erin.id, project_id: news_chic.id)

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("Number of Contestants: 4")
  end
end