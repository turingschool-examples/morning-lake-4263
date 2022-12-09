class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @contestant_count = @project.contestant_count
    @average_experience = @project.average_contestant_experience
  end
end