require 'rails_helper'

RSpec.describe Project do
    before(:each) do
        @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    end

    it 'has projects index' do
        visit '/projects'

        expect(page).to have_content(@upholstery_tux.name)
        expect(current_path).to eq '/projects'
    end

    it 'has project show page' do
        visit "/projects/#{@upholstery_tux.id}"

        expect(page).to have_content(@upholstery_tux.name)
        expect(page).to have_content(@upholstery_tux.material)
        expect(page).to have_content(@upholstery_tux.challenge.theme)
    end
end