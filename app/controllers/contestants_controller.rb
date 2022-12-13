class ContestantsController < ApplicationController
  def index
    @contestants = Contestants.find(params[:id])
  end
end