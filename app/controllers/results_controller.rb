class ResultsController < ApplicationController
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction
  
  def index
    @results = Result.select(:player_id).group('player_id')                    
                     .select('sum(game_points) as total, count(player_id) as played, sum(legs_pro) as total_legs_pro')
                     .order('total desc, played asc, total_legs_pro desc')
  end
  
  def sort_by_average
    @order_average = Result.select(:player_id).group('player_id')                    
                           .select('avg(average) as average_total')
                           .order('average_total desc')
  end
  
  def sort_by_co
    @order_co = Result.select(:player_id).group('player_id')                    
                      .select('avg(co) as co_total')
                      .order('co_total desc')
  end
  
  def sort_by_hs
    @order_hs = Result.select(:player_id).group('player_id')
                      .select('max(hs) as max_hs')
                      .order('max_hs desc')
                      
  end  
end
