class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @count = @project.contestant_count
  end
end