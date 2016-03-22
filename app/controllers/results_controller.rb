class ResultsController < ApplicationController
  def index
    @results = Result.group('results.player_id')
  end
end
