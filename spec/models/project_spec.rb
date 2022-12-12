require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }
  let!(:furniture_challenge) { Challenge.create(theme: "Apartment Furnishings", project_budget: 1000) }

  let!(:news_chic) { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") }
  let!(:upholstery_tux) { furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch") }
  let!(:lit_fit) { furniture_challenge.projects.create(name: "Litfit", material: "Lamp") }

  let!(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) {  Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:kentaro) { Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8) }
  let!(:erin) { Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:relationship) { ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:relationship_1) { ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id) }
  let!(:relationship_2) { ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id) }
  let!(:relationship_3) { ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id) }
  let!(:relationship_4) { ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id) }
  let!(:relationship_5) { ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id) }

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#contestant_count" do
    it 'counts the number of contestants on a project' do
      expect(boardfit.contestant_count).to eq(2)
    end
  end

  describe "#project_theme" do
    it 'returns the theme of the project' do
      expect(boardfit.challenge_theme).to eq("Recycled Material")
    end
  end
end
