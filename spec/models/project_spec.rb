require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "instance variables" do
    let!(:recycled_material_challenge) {Challenge.create(theme: "Recycled Material", project_budget: 1000)}
    let!(:furniture_challenge) {Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)}
    let!(:news_chic) {recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")}
    let!(:upholstery_tux) {furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")}
    let!(:jay) {Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)}
    let!(:gretchen) {Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)}
    let!(:kentaro) {Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)}

    it "challenge_theme" do
      expect(news_chic.challenge_theme).to eq(news_chic.challenge.theme)
    end

    it "contestants_count" do
      ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)

      expect(news_chic.contestants_count).to eq(1)
      expect(upholstery_tux.contestants_count).to eq(2)
    end
  end
end
