class GamesController < ApplicationController
  before_action :authenticate_user!
  
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
    @players = Player.all
    if @game.save
      flash.now[:success] = "Added new game"
      redirect_to games_path
    else
      flash.now[:error] = "Error"
      render "new"
    end
  end
  
  def edit
    @game = Game.find(params[:id])
    @players = Player.all
  end
  
  def update
    @game = Game.find(params[:id])
    @players = Player.all
    if @game.update_attributes(game_params)
      flash.now[:success] = "Game updated"
      redirect_to games_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Game.find(params[:id]).destroy
    flash[:success] = "Game deleted."
    redirect_to games_path
  end
  
  private
  
  def game_params
    params.require(:game).permit(:id, :_destroy, :game_date,
                                    :results_attributes => [:id, :_destroy, :player_id, :place, :game_id, :legs_pro, :legs_contra,
                                    :average, :hs, :co])
  end
end
