require 'rails_helper'

RSpec.describe 'the contestants index page' do
  before :each do 
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
  end

  it 'lists all contestants and each project they have worked on' do 
    visit '/contestants'
    expect(page).to have_content(@jay.name)
    expect(page).to have_content(@lit_fit.name)

    expect(page).to have_content(@gretchen.name)
    expect(page).to have_content(@news_chic.name)

    save_and_open_page

  end
end