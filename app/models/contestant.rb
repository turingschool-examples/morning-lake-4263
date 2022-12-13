class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects
  
  validates_presence_of :name, :age, :hometown, :years_of_experience

  def all_the_projects
    # require 'pry'; binding.pry
    self.projects
  end
end
