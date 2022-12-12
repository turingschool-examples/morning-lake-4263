require 'rails_helper'


RSpec.describe Contestant, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :hometown}
    it {should validate_presence_of :years_of_experience}
  end

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end
  
  describe '#project_names' do
    it 'returns an array of projects the contestant is associated with' do 
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
      
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      jay.projects << news_chic
      jay.projects << upholstery_tux
      jay.projects << lit_fit
      gretchen.projects << lit_fit
      gretchen.projects << upholstery_tux

      expect(jay.project_names).to match_array(["News Chic", "Upholstery Tuxedo", "Litfit"])
      expect(gretchen.project_names).to match_array(["Litfit", "Upholstery Tuxedo"])
    end
  end
end
