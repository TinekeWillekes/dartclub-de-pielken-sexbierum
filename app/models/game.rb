class Game < ActiveRecord::Base
  has_many :results
  has_many :players, :through => :results
  
  def home_player
    Player.joins(:games).where(:results => {:place => 1, :game_id => self.id}).first
  end
  
  def home_player_legs_pro
    Result.joins(:games).where({:place => 1, :game_id => self.id}).first
  end
   
  def home_player=(player)
    self.players << player

    s = self.results.find_by_player_id(player)
    s.place = 1
    s.save
  end

  def away_player
    Player.joins(:games).where(:results => {:place => 0, :game_id => self.id}).first
  end

  def away_player=(player)
    self.players << player

    s = self.results.find_by_player_id(player)
    s.place = 0
    s.save
  end   
end
