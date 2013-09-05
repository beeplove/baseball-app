class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :team
      t.string :surname
      t.string :given_name
      t.string :position
      t.integer :games
      t.integer :games_started
      t.integer :complete_games
      t.integer :shut_outs
      t.decimal :era
      t.integer :at_bats
      t.string :runs
      t.string :earned_runs
      t.string :innings
      t.integer :hits
      t.string :hit_batter
      t.string :wild_pitches
      t.string :balk
      t.string :walked_batter
      t.string :doubles
      t.string :triples
      t.integer :home_runs
      t.integer :rbi
      t.string :steals
      t.string :caught_stealing
      t.string :sacrifice_hits
      t.string :sacrifice_flies
      t.integer :errs
      t.string :pb
      t.string :walks
      t.string :struck_out
      t.string :hit_by_pitch
      t.timestamps
    end
  end
end