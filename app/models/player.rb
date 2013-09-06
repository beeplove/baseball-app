class Player < ActiveRecord::Base
  belongs_to :team

  attr_accessible :team_id

  attr_accessible :at_bats
  attr_accessible :caught_stealing
  attr_accessible :doubles
  attr_accessible :triples
  attr_accessible :home_runs
  attr_accessible :errs
  attr_accessible :games
  attr_accessible :games_started
  attr_accessible :hit_by_pitch
  attr_accessible :hits
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
  attr_accessible :walks
  attr_accessible :complete_games
  attr_accessible :shut_outs
  attr_accessible :era
  attr_accessible :innings
  attr_accessible :earned_runs
  attr_accessible :hit_batter
  attr_accessible :wild_pitches
  attr_accessible :balk
  attr_accessible :walked_batter

  def name
    [given_name, surname].join(' ')
  end

  def avg
    # TODO if hits or at_bats not present, should avg be 0?
    return 0 if hits.blank? || at_bats.blank?
    return 0 if hits.to_i.zero? || at_bats.to_i.zero?
    '%.3f' % (hits.to_f / at_bats)
  end

  # TODO refactor code to remove duplication
  def rbi
    read_attribute(:rbi).to_i
  end

  def home_runs
    read_attribute(:home_runs).to_i
  end

  def runs
    read_attribute(:runs).to_i
  end

  def steals
    read_attribute(:steals).to_i
  end

  def hits
    read_attribute(:hits).to_i
  end

  def doubles
    read_attribute(:doubles).to_i
  end

  def triples
    read_attribute(:triples).to_i
  end

  def at_bats
    read_attribute(:at_bats).to_i
  end

  def walks
    read_attribute(:walks).to_i
  end

  def hit_by_pitch
    read_attribute(:hit_by_pitch).to_i
  end

  def sacrifice_flies
    read_attribute(:sacrifice_flies).to_i
  end

  # H = Hits
  # BB = Base on balls, better known as walk
  # HBP = Times hit by pitch
  # AB = At bats
  # SF = Sacrifice flies
  # TB = Total bases
  def ops
    # OPS = OBP + SLG
    '%.3f' % (obp + slg)
  end

  def obp
    # OBP = (H + BB + HBP) / (AB + BB + SF + HBP)
    v1 = hits + walks + hit_by_pitch
    v2 = at_bats + walks + sacrifice_flies + hit_by_pitch
    return 0 if v1.zero? || v2.zero?

    v1 / v2.to_f
  end

  def slg
    # SLG = TB / AB
    return 0 if tb.zero? || at_bats.zero?
    tb / at_bats.to_f
  end

  # Add total hits and doubles together.
  # Add to this number 2 times the number of triples.
  # Add to this number 3 times the number of home runs.
  # This is total bases.
  def tb
    hits + doubles + (triples * 2) + (home_runs * 3)
  end
end
