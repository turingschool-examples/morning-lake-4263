require 'rails_helper'

RSpec.describe "Project Show" do
  let!(:recycled_material_challenge) {Challenge.create(theme: "Recycled Material", project_budget: 1000)}
  let!(:furniture_challenge) {Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)}
  let!(:news_chic) {recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")}
  let!(:upholstery_tux) {furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")}
  let!(:jay) {Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)}
  let!(:gretchen) {Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)}
  let!(:kentaro) {Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)}
  let!(:erin) {Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)}

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
  
  describe "Extension Story 1" do
    it "Average years of experience for contestant by project" do
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      
      # When I visit a project's show page
      visit "/projects/#{news_chic.id}"
      # I see the average years of experience for the contestants that worked on that project
      expect(page).to have_content("Average Contestant Experience:")
      expect(page).to have_content("12.5 years")
      
      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings
      #   Number of Contestants: 3
      #   Average Contestant Experience: 10.25 years)
    end
  end
  
  describe "Extension Story 2" do
    it "Adding a contestant to a project" do
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      # When I visit a project's show page
      visit "/projects/#{news_chic.id}"
      expect(news_chic.contestants_count).to eq 2
      # I see a form to add a contestant to this project
      expect(page).to have_field("Add contestant")    
      # When I fill out a field with an existing contestants id
      fill_in("Add contestant", with: kentaro.id)
      # And hit "Add Contestant To Project"
      expect(page).to have_button("Add Contestant To Project")
      click_button("Add Contestant To Project")
      # I'm taken back to the project's show page
      expect(current_path).to eq("/projects/#{news_chic.id}")
      # And I see that the number of contestants has increased by 1
      expect(news_chic.contestants_count).to eq 3
      # And when I visit the contestants index page
      visit "/contestants"
      # I see that project listed under that contestant's name
      expect(kentaro.project_names.include?(news_chic.name)).to be true 
      expect(page).to have_content(kentaro.project_names.last)
    end
  end
end