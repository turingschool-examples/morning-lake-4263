require 'rails_helper'

RSpec.describe "Contestants Index page" do
  before (:each) do
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
  
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @contest_pro1 = ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    @contest_pro2 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    @contest_pro3 = ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    @contest_pro4 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    @contest_pro5 = ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    @contest_pro6 = ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  describe 'User Story 2' do
    it "lists all the names of the contestants" do
      visit "/contestants"

      expect(page).to have_content("Kentaro Kameyama")
      expect(page).to have_content("Upholstery Tuxedo")
      expect(page).to have_content("Jay McCarroll")
    end
  end
end