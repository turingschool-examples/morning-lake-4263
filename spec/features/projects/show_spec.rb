require 'rails_helper'

RSpec.describe "Project Show" do
  let!(:recycled_material_challenge) {Challenge.create(theme: "Recycled Material", project_budget: 1000)}
  let!(:furniture_challenge) {Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)}
  let!(:news_chic) {recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")}
  let!(:upholstery_tux) {furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")}
  let!(:jay) {Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)}
  
  describe "User Story 1" do
    it "shows the project name and material, as well as challenge theme" do
      # When I visit a project's show page ("/projects/:id"),
      visit "/projects/#{news_chic.id}"  
      # I see that project's name 
      expect(page).to have_content(news_chic.name)
      # and material
      expect(page).to have_content(news_chic.material)
      # And I also see the theme of the challenge that this project belongs to.
      expect(page).to have_content(recycled_material_challenge.theme)
      expect(page).to_not have_content(furniture_challenge.theme)
      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings)
    end
  end

  describe "User Story 3" do
    it "displays number of contestants on a project" do
      # When I visit a project's show page
      visit "/projects/#{news_chic.id}"
      # I see a count of the number of contestants on this project
      expect(page).to have_content("Number of Contestants:")
      expect(page).to have_content(news_chic.contestants.length)
      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings
      #   Number of Contestants: 3 )
    end
  end
end