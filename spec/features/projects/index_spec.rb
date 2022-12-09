require 'rails_helper'

RSpec.describe 'projects index page' do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
  end
  
  describe 'visit the project index page at /projects' do
    it 'see all project names' do
      visit '/projects'
      
      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content(@boardfit.name)
      expect(page).to have_content(@boardfit.material)
      
      expect(page).to have_content(@upholstery_tux.name)
      expect(page).to have_content(@upholstery_tux.material)
      expect(page).to have_content(@lit_fit.name)
      expect(page).to have_content(@lit_fit.material)
    end
    
    # As a visitor,
    # I see that project's name and material
    # And I also see the theme of the challenge that this project belongs to.
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings)  
  end
  
end