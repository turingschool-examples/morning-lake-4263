class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    @count = @project.contestant_count
  end


end