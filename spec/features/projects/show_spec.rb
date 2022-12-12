require 'rails_helper'

RSpec.describe 'projects show page', type: :feature do 
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

  end
  it 'displays the specific projects name and material' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
    expect(page).to_not have_content("Boardfit")

    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Boardfit")
    expect(page).to have_content("Cardboard Boxes")
    expect(page).to_not have_content("News Chic")
  end

  it 'displays the theme of the challenge that the project belongs to' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Recycled Material")
  end

  it 'displays the number on contestants on the specific project' do
    @news_chic.contestants << @jay
    @news_chic.contestants << @gretchen
    @news_chic.contestants << @erin
    
    visit "/projects/#{@news_chic.id}"
    
    expect(page).to have_content("Number of Contestants: 3")

    @boardfit.contestants << @jay
    @boardfit.contestants << @gretchen
    @boardfit.contestants << @erin
    @boardfit.contestants << @kentaro

    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Number of Contestants: 4")
  end
end