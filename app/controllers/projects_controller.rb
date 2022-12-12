class ProjectsController < ApplicationController 
  def show 
    @project = Project.find(params[:id])
    @contestant_count = @project.contestants.count
  end
end