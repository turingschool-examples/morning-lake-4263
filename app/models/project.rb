class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.count
  end

  def contestant_experience
    contestants.select(:years_of_experience).average(:years_of_experience).to_f.round(2)  
  end
end
