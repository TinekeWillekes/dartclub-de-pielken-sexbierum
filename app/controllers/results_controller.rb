class ResultsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @results = Result.select(:player_id).group('player_id').select('player_id, sum(game_points) as total').order('total desc')
  end
  
  def ranking_order

  end
end
