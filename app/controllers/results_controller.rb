class ResultsController < ApplicationController
  def index
    @results = Result.select([:id, :player_id]).group('player_id')
  end
end
