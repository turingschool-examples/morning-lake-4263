class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects
  
  def list_projects
    projects.map do |project|
      project.name
    end
  end
  
  def total_projects
    projects.count
  end
end
