class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.all
    # @contestant_projects = ContestantProject.all
  end
end