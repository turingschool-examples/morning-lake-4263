class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def show
    @projects = Project.all
    @project = Project.find(params[:id])
  #  require 'pry'; binding.pry
  end
end