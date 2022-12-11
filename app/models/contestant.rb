class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def has_projects?
    projects.any?
  end

  def project_names
    projects.pluck(:name)
  end
  
end
