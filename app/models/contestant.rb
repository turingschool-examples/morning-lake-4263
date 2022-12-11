class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience
  
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def project_list
    all_projects = []
    self.projects.each do |project|
      all_projects << project.name
    end
    project_list = all_projects.join(", ")
    "Projects: #{project_list}"
  end
end
