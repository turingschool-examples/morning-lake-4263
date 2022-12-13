require 'rails_helper'

RSpec.describe "Projects Show page" do
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

  describe 'User Story 1' do
    it "see the projects name and material and challenge name" do
      visit "/projects/#{@lit_fit.id}"
#  require 'pry'; binding.pry
# save_and_open_page

      expect(page).to have_content(@lit_fit.name)
      expect(page).to have_content(@lit_fit.material)
      expect(page).to have_content("Apartment Furnishings")
    end
  end

  describe 'User Story 3' do
    it 'shows how many contests are on each project' do
      visit "/projects/#{@lit_fit.id}"


      expect(page).to have_content("Number of Contestants")
      expect(page).to have_content(2)
    end
  end

  describe "Extention 1" do
    it 'average total years of experience' do
       visit "/projects/#{@news_chic.id}"
save_and_open_page
       expect(page).to have_content("Average Contestant Experience")
       expect(page).to have_content(12.5)
    end
  end
end