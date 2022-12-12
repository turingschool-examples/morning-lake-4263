require 'rails_helper'

RSpec.describe 'the projects show page' do
  before :each do 
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
  end
  it 'displays the projects name, material and theme' do 
    visit "/projects/#{@news_chic.id}"
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Newspaper")
    expect(page).to have_content("Recycled Material")
  end
end