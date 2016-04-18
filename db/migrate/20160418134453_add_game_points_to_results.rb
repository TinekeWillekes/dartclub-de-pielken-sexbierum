class AddGamePointsToResults < ActiveRecord::Migration
  def change
    add_column :results, :game_points, :integer
  end
end
