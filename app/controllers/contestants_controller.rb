class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end
end

# <div id="contestant-section-<%={contestant.id}%>">