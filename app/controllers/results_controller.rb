class ResultsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @results = Result.select(:player_id).group('player_id').select('sum(game_points) as total, count(player_id) as played').order('total desc, played asc')
  end
  
  def ranking_order

  end
end
