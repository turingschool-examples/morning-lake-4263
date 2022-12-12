class ContestantsController < ApplicationController 
  def index 
    @contestants_projects = Contestant.joins(:projects)
  end
end