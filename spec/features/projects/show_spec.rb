require 'rails_helper'
require 'test_helper'

RSpec.describe "Projects Show Page" do
  before :each do
    seed_challenges
    seed_projects
    seed_contestants
    seed_contestant_projects
  end

  describe "User visits /projects/:id" do
    it "shows project attributes and theme of associated challenge" do
      visit "/projects/#{Project.first.id}"

      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content("Recycled Material")
    end
  end
end