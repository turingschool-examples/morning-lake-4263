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

  describe '.contestant_count' do
    @contestant_1 = create(:contestant)
    @contestant_2 = create(:contestant)
    @contestant_3 = create(:contestant)
    @challenge_1  = create(:challenge)
    @project_1    = create(:project, challenge: @challenge_1)
    @project_2    = create(:project, challenge: @challenge_1)
    @project_3    = create(:project, challenge: @challenge_1)
    @contestant_1.projects << @project_1
    @contestant_1.projects << @project_2
    @contestant_2.projects << @project_1
    @contestant_2.projects << @project_3
    @contestant_4.projects << @project_2

    expect(@project_1.contestant_count).to eq(2)
    expect(@project_2.contestant_count).to eq(2)
    expect(@project_3.contestant_count).to eq(1)
  end
end
