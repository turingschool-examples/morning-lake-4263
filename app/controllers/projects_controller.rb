class ProjectsController < ApplicationController
  def show
    @show = Project.find(params[:id])
    @show_count = @show.contestant_count
  end
end