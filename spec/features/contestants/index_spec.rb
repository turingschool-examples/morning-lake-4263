require 'rails_helper'

RSpec.describe 'the contestants index page' do

  before :each do
    @contestant_1 = create(:contestant)
    @contestant_2 = create(:contestant)
    @contestant_3 = create(:contestant)
    @contestant_4 = create(:contestant)
    @contestant_5 = create(:contestant)
    @challenge_1  = create(:challenge)
    @challenge_2  = create(:challenge)
    @challenge_3  = create(:challenge)
    @project_1    = create(:project, challenge: @challenge_1)
    @project_2    = create(:project, challenge: @challenge_2)
    @project_3    = create(:project, challenge: @challenge_3)

    @contestant_1.projects << @project_1
    @contestant_1.projects << @project_2

    @contestant_2.projects << @project_1
    @contestant_2.projects << @project_3

    @contestant_4.projects << @project_2
  end

  describe 'User Story 1' do
    it "shows the project and all it's attributes" do

      visit "/contestants"

      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content(@contestant_3.name)
      expect(page).to have_content(@contestant_4.name)
      expect(page).to have_content(@contestant_5.name)
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_2.name)
      expect(page).to have_content(@project_3.name)
    end
  end
end
