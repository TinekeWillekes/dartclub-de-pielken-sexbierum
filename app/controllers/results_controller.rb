class ResultsController < ApplicationController
  def index
    @results = Result.select(:player_id).group('player_id')
  end
end
