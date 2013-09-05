class Player
  # SURNAME
  # GIVEN_NAME
  # POSITION
  # GAMES
  # GAMES_STARTED
  # AT_BATS
  # RUNS
  # HITS
  # DOUBLES
  # TRIPLES
  # HOME_RUNS => hr
  # RBI
  # STEALS => sb
  # CAUGHT_STEALING
  # SACRIFICE_HITS
  # SACRIFICE_FLIES
  # ERRORS
  # PB
  # WALKS
  # STRUCK_OUT
  # HIT_BY_PITCH

  attr_reader :surname, :given_name, :position, :games, :games_started, :at_bats, :runs, :hits,
    :doubles, :triples, :hr, :rbi, :sb, :caught_stealing, :sacrifice_hits, :sacrifice_flies,
    :errors, :pb, :walks, :struck_out, :hit_by_pitch
  attr_reader :team

  def initialize data, team
    @surname = data['SURNAME']
    @given_name = data['GIVEN_NAME']
    @rbi = data['RBI'].to_i
    @hr = data['HOME_RUNS'].to_i
    @sb = data['STEALS'].to_i
    @runs = data['RUNS'].to_i

    @hits = data['HITS'].to_i
    @at_bats = data['AT_BATS'].to_i

    @team = team
  end

  def name
    [given_name, surname].join(' ')
  end

  def avg
    return 0 if hits.zero? || at_bats.zero?

    '%.3f' % (hits.to_f / at_bats)
  end
end