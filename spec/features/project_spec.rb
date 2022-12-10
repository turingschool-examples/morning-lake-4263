require 'rails_helper'

RSpec.describe Project do
    before(:each) do
        @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

        @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

        ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
        ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    end

    it 'has projects index' do
        visit '/projects'

        expect(current_path).to eq '/projects'
        expect(page).to have_content(@upholstery_tux.name)
    end

    it 'has project show page' do
        visit "/projects/#{@upholstery_tux.id}"

        expect(current_path).to eq("/projects/#{@upholstery_tux.id}")
        expect(page).to have_content(@upholstery_tux.name)
        expect(page).to have_content(@upholstery_tux.material)
        expect(page).to have_content(@upholstery_tux.challenge.theme)
        expect(page).to have_content(@upholstery_tux.contestants.count)
    end
end