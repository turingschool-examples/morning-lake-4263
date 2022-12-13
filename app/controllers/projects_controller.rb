class ProjectsController < ApplicationController
  def show
    @show = Project.find(params[:id])
  end
end