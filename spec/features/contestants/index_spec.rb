require 'rails_helper'

RSpec.describe "Contestants Index" do
  describe "User Story 2" do
    let!(:recycled_material_challenge) {Challenge.create(theme: "Recycled Material", project_budget: 1000)}
    let!(:furniture_challenge) {Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)}
    let!(:news_chic) {recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")}
    let!(:upholstery_tux) {furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")}
    let!(:jay) {Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)}
    let!(:gretchen) {Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)}
    let!(:kentaro) {Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)}
    let!(:erin) {Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)}


    it "lists names of all contestants, and project names associated" do
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      # When I visit the contestants index page ("/contestants")
      visit "/contestants"
      # I see a list of names of all the contestants
      expect(page).to have_content(jay.name)
      expect(page).to have_content(gretchen.name)
      expect(page).to have_content(kentaro.name)
      expect(page).to have_content(erin.name)
      # And under each contestants name I see a list of the projects (names) that they've been on
      expect(page).to have_content("News Chic")
      expect(page).to have_content("Upholstery Tuxedo")

      # (e.g.   Kentaro Kameyama
      #         Projects: Litfit, Rug Tuxedo

      #         Jay McCarroll
      #         Projects: LeatherFeather)
    end
  end
end