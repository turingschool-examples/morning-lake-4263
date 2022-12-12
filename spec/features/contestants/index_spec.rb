require 'rails_helper'

RSpec.describe 'contestant index page', type: :feature do 
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

  it 'displays a list of all contestants names' do 
    visit "/contestants"

    expect(page).to have_content(@jay.name)
    expect(page).to have_content("Gretchen Jones")
    expect(page).to have_content("Kentaro Kameyama")
    expect(page).to have_content("Erin Robertson")
  end

  it 'displays all of project names that each contestant has worked on' do
    @jay.projects << @news_chic
    @jay.projects << @boardfit
    @jay.projects << @upholstery_tux
    @gretchen.projects << @news_chic
    @kentaro.projects << @upholstery_tux
    @kentaro.projects << @lit_fit
    @erin.projects << @lit_fit
    @erin.projects << @news_chic

    visit "/contestants"

    within("section#contestant-#{@jay.id}") do
      expect(page).to have_content("News Chic")
      expect(page).to have_content("Boardfit")
      expect(page).to have_content("Upholstery Tuxedo")
    end
    
    within("section#contestant-#{@gretchen.id}") do
      expect(page).to have_content("News Chic")
    end

    within("section#contestant-#{@kentaro.id}") do
      expect(page).to have_content("Litfit")
      expect(page).to have_content("Upholstery Tuxedo")
    end

    within("section#contestant-#{@erin.id}") do
      expect(page).to have_content("Litfit")
      expect(page).to have_content("News Chic")
    end
  end
end