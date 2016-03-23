class PlayersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @player_results = @player.results.all
    @games = @player.games   
  end
end
