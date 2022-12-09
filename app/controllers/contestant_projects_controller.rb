class ContestantProjectsController < ApplicationController
  def create
    contestant_project = ContestantProject.new({project_id: params[:project_id], contestant_id: params[:add_contestant]})

    contestant_project.save

    redirect_to "/projects/#{params[:project_id]}"
  end
end