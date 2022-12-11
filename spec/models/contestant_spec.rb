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

  describe "instance methods" do
    let!(:recycled_material_challenge) {Challenge.create(theme: "Recycled Material", project_budget: 1000)}
    let!(:furniture_challenge) {Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)}
    let!(:news_chic) {recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")}
    let!(:upholstery_tux) {furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")}
    let!(:jay) {Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)}
    let!(:gretchen) {Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)}
    let!(:kentaro) {Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)}
    let!(:erin) {Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)}

    it "has_projects?" do 
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)

      expect(erin.has_projects?).to be false
      expect(jay.has_projects?).to be true
    end

    it "project_names" do
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

      expect(jay.project_names).to eq([news_chic.name])
      expect(gretchen.project_names).to eq([news_chic.name, upholstery_tux.name])
    end
  end
end
