class ProjectsController < ApplicationController
  def show
    @show = Show.find(params[:id])
end