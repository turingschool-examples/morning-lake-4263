require 'rails_helper'
require 'test_helper'

RSpec.describe "Projects Show Page" do
  describe "User visits /projects/:id" do
    it "shows project attributes and theme of associated challenge" do
      visit "/projects/#{@news_chic.id}"

      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content("Recycled Material")
    end
  end
end