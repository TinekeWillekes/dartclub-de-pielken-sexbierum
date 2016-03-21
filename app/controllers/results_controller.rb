class ResultsController < ApplicationController
  def index
    @results = Result.group('player_id')
  end
end
