class ResultsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @results = Result.select(:player_id).group('player_id').select('sum(game_points) as total, count(player_id) as played, sum(legs_pro) as total_legs_pro').order('total desc, played asc, total_legs_pro desc')
  end
end
