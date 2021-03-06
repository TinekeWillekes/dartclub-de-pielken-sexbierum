class Player < ActiveRecord::Base
  has_many :results
  has_many :games, -> { order(:game_date => :asc) }, :through => :results

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing/missing.jpg"
  validates_attachment_content_type :avatar, 
                                    :content_type => /^image\/(png|gif|jpeg|jpg)/,
                                    :message => 'only (png/gif/jpeg/jpg) images'
  
  validates :name, presence: true
  
  def count_games_won
    Game.joins(:players).where(:results => {:legs_pro => 4, :player_id => self.id}).count
  end
  
  def count_games_lost
    Game.joins(:players).where.not(:results => {:legs_pro => 4}).where(:results => {:player_id => self.id}).count
  end
  
  def players_chart
    Game.joins(:players).where(:results => {:player_id => self.id})
  end
end
