class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def challenge_theme
    challenge.theme
  end
  
  def contestants_count
    contestants.count
  end

  def average_years_contestant_experience
    ages = contestants.pluck(:years_of_experience)
    (ages.sum * 1.0)/(ages.length)
  end
end
