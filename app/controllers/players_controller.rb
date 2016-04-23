class PlayersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @players = Player.all.paginate(:page => params[:page], :per_page => 7)
  end

  def show
    @player = Player.find(params[:id])
    @player_results = @player.results.all
    @games = @player.games.order('created_at ASC')
    @chart_results = @player.results.all.order('created_at ASC')
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
      flash.now[:success] = "Added new player"
      redirect_to players_path
    else
      flash.now[:error] = "Error"
      render "new"
    end
  end
  
  def edit
    @player = Player.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash.now[:success] = "Player updated"
      redirect_to players_path
    else
      render 'edit'
    end
  end
  
  def destroy
    Player.find(params[:id]).destroy
    flash[:success] = "Player deleted."
    redirect_to players_path
  end
 
  private
  
  def player_params
    params.require(:player).permit(:id, :_destroy, :name, :avatar)
  end
end
