class Project < ApplicationRecord
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects
  validates_presence_of :name, :material
  belongs_to :challenge

  def contestant_average
    self.contestants.average(:years_of_experience)
    # require 'pry'; binding.pry
  end
end
# <p>Number of Contestants: <%= project.challenge %> </p>