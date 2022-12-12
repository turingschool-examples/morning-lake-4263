class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    self.contestants.distinct.count
  end

  def avg_yrs_experience
    contestants = self.contestants
    contestants.sum{|contestant| contestant.years_of_experience} / contestants.count
  end
end
