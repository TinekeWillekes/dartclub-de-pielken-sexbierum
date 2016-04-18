class Result < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  
  accepts_nested_attributes_for :game,
           :reject_if => :all_blank, 
           :allow_destroy => true
         
  validates :player_id, presence: true
  validates :place, presence: true
  validates :game_points, presence: true
  validates :legs_pro, presence: true, numericality: true
  validates :legs_contra, presence: true, numericality: true
  validates :average, presence: true, numericality: true
  validates :hs, presence: true, numericality: true
  validates :co, presence: true, numericality: true
end
