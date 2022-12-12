class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    if params[:query].present?
      redirect_to "/projects/#{@project.id}" 
    end
  end
end