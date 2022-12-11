class ContestantProjectsController < ApplicationController
  def create
    ContestantProject.create!(contestantproject_params)
    redirect_to "/projects/#{params[:project_id]}"
  end

private
  def contestantproject_params
    params.permit(:project_id, :contestant_id)
  end
end