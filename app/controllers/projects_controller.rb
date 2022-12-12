class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @contestants = Contestant.all
  end
end