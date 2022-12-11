class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def get_challenge
    self.challenge
  end

  def get_contestant_count
    self.contestants.size
  end
end
