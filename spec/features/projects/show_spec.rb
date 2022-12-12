require 'rails_helper'

RSpec.describe 'the projects show page' do

  before :each do
    @challenge = create(:challenge)
    @project   = create(:project, challenge: @challenge)
  end

  describe 'User Story 1' do
    it "shows the project and all it's attributes" do

      visit "/projects/#{@project.id}"

      expect(page).to have_content(@project.name)
      expect(page).to have_content(@project.material)
      expect(page).to have_content(@project.challenge.theme)
    end
  end
end
