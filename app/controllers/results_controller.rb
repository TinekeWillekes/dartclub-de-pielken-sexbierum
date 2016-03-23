class ResultsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @results = Result.select(:player_id).group('player_id')
  end
end
