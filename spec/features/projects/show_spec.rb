require 'rails_helper'

RSpec.describe 'the projects show page' do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
  end
  
  describe 'visit /projects/:id' do
    it 'shows the project name and material' do
      visit "/projects/#{@news_chic.id}"
      
      save_and_open_page
      
      expect(page).to have_content(@news_chic.name) 
      expect(page).to have_content(@news_chic.material) 
      # expect(page).to have_content(@news_chic.) 
    end
    
    it 'shows the project name and material' do
      visit "/projects/#{@boardfit.id}"
      
      expect(page).to have_content(@boardfit.name)
      expect(page).to have_content(@boardfit.material)
    end
  end
  # As a visitor,
  # When I visit a project's show page ("/projects/:id"),
  # I see that project's name and material
  # And I also see the theme of the challenge that this project belongs to.
  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings)  
  
end