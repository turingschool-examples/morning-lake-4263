class Contestant < ApplicationRecord
  validates_presence_of :name, :age, :hometown, :years_of_experience

  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def list_projects
    if self.projects == []
      return 'This contestant has no projects'
    else
      project_list = self.projects.map { |project| project.name }.join(', ')
      "Projects: #{project_list}"
    end
  end
end
