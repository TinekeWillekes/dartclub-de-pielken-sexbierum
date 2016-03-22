class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @game_results = @game.results.all
  end
  
  def new
    @game = Game.new
    @players = Player.all
  end
  
  def create
    @game = Game.new(game_params)
    if @game.save
      flash.now[:success] = "Added new game"
      redirect_to games_path
    else
      flash.now[:error] = "Error"
      render "new"
    end
  end
  
  def game_params
    params.require(:game).permit(:id, :_destroy, :game_date,
                                    :results_attributes => [:id, :_destroy, :player_id, :place, :game_id, :legs_pro, :legs_contra,
                                    :average, :hs, :co])
  end
end
