require 'rails_helper'
require 'test_helper'

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

  describe "#list_projects" do
    it 'puts all contestant projects into a comma-separated list' do
      seed_challenges
      seed_projects
      seed_contestants
      seed_contestant_projects

      expect(@gretchen.list_projects).to eq("News Chic, Upholstery Tuxedo")
    end
  end
end
