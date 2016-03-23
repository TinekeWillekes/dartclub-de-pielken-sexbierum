class ResultsController < ApplicationController
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction
  
  def index
    @results = Result.select(:player_id).group('player_id').order(sort_column + " " + sort_direction)
  end
  
  private
  
  def sort_column
    Result.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
