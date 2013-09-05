class Player < ActiveRecord::Base
  belongs_to :team
  attr_accessible :at_bats
  attr_accessible :caught_stealing
  attr_accessible :doubles
  attr_accessible :errs
  attr_accessible :games
  attr_accessible :games_started
  attr_accessible :hit_by_pitch
  attr_accessible :hits
  attr_accessible :home_runs
  attr_accessible :pb
  attr_accessible :position
  attr_accessible :rbi
  attr_accessible :runs
  attr_accessible :sacrifice_flies
  attr_accessible :sacrifice_hits
  attr_accessible :steals
  attr_accessible :struck_out
  attr_accessible :surname
  attr_accessible :given_name
  attr_accessible :triples
  attr_accessible :walks
  attr_accessible :team_id
  attr_accessible :complete_games, :shut_outs, :era, :innings, :earned_runs, :hit_batter, :wild_pitches, :balk, :walked_batter

  def name
    [given_name, surname].join(' ')
  end

  def avg
    # TODO if hits or at_bats not present, should avg be 0?
    return 0 if hits.blank? || at_bats.blank?
    return 0 if hits.to_i.zero? || at_bats.to_i.zero?
    '%.3f' % (hits.to_f / at_bats)
  end

  def hr
    home_runs
  end

  def home_runs
    read_attribute(:home_runs).to_i
  end

  def runs
    read_attribute(:runs).to_i
  end
end
