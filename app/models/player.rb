class Player < ActiveRecord::Base
  has_many :results
  has_many :games, :through => :results
  
  def count_games_won
    Game.joins(:players).where(:results => {:legs_pro => 4, :player_id => self.id}).count
  end
  
  def count_games_lost
    Game.joins(:players).where.not(:results => {:legs_pro => 4}).where(:results => {:player_id => self.id}).count
  end
end
