class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :place
      t.integer :legs_pro
      t.integer :legs_contra
      t.decimal :average, precision: 5, scale: 2
      t.integer :hs
      t.decimal :co, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
