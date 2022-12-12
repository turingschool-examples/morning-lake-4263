class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects
  validates_presence_of :name, :age, :hometown, :years_of_experience

  def self.project_names
    # binding.pry
  #  project_id = self.contestant_projects.project_id
    # select(name:).joins
    # @contestant_projects = ContestantProject.all
    # @contestant_projects
  end
end
