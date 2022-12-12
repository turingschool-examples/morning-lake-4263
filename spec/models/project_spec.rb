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

  describe "#contestant_count" do
    it 'returns the number of contestants on a project' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      ContestantProject.create(contestant_id: jay.id, project_id: boardfit.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: boardfit.id)
      
      expect(boardfit.contestant_count).to eq(2)

      ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
  
      expect(boardfit.contestant_count).to eq(3)
    end
  end

  describe '#contestant_experience' do
    it 'returns the average number of years experience for contestants on the project' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      ContestantProject.create(contestant_id: jay.id, project_id: boardfit.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: boardfit.id)
      
      expect(boardfit.contestant_experience).to eq(12.50)

      ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
  
      expect(boardfit.contestant_experience).to eq(11)
    end
  end

  describe '#add_contestant()' do
    it 'adds a contestant to the project when passed the contestant ID' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
      ContestantProject.create(contestant_id: jay.id, project_id: boardfit.id)

      expect(boardfit.contestant_count).to eq(1)

      boardfit.add_contestant(gretchen.id)

      expect(boardfit.contestant_count).to eq(2)
      expect(gretchen.projects).to include(boardfit)
    end
  end
end

