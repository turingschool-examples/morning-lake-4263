class Project < ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge


  def theme
    challenge.theme
  end

  def count
    # binding.pry
    projects = Contestant.all.each do |c|
      c.projects
    end
    projects.count
  end

end
