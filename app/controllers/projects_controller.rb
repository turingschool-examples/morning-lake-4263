class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @contestant_count = @project.contestant_count
  end
end