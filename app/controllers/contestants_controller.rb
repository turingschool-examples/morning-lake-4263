class ContestantsController < ApplicationController
  def index
    binding.pry
    @contestants = Contestant.all
  end
end