class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @challenge = @project.challenge
    @contestant_count = @project.contestant_count
    @contestant_experience = @project.contestant_experience
    if params[:ContestantID]
      @project.add_contestant(params[:ContestantID])
      redirect_to "/projects/#{@project.id}"
    end
  end
end
