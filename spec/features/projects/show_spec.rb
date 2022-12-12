require 'rails_helper'

RSpec.describe 'the projects show page' do

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

  describe 'attributes' do
    it "shows the project and all it's attributes" do

      visit "/projects/#{@project_1.id}"

      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_1.material)
      expect(page).to have_content(@project_1.challenge.theme)
    end

    it 'displays count of contestants on the project' do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Number of Contestants: 2")
    end

    it 'displays the Average Contestant Experience by project' do
      visit "/projects/#{@project_1.id}"

      expect(page).to have_content("Average Contestant Experience: #{@project_1.average_years_experience}")
    end
  end
end
