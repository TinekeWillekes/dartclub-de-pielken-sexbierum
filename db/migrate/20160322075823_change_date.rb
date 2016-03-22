class ChangeDate < ActiveRecord::Migration
  def change
    rename_column :games, :date, :game_date
  end
end
