require 'open-uri'


namespace :baseball do
  desc "TODO"
  task :load_1998 => :environment do
    xml = Nokogiri::XML(open('http://www.cafeconleche.org/examples/baseball/1998statistics.xml'))
    data = Hash.from_xml(xml.to_s)

    Season.destroy_all(year: 1998)

    season_data = data['SEASON']
    season = Season.create(year: season_data['YEAR'])
    season_data['LEAGUE'].each do |league_data|
      league = League.create(name: league_data['LEAGUE_NAME'], season_id: season.id)
      league_data['DIVISION'].each do |division_data|
        division = Division.create(name: division_data['DIVISION_NAME'], league_id: league.id)
        division_data['TEAM'].each do |team_data|
          team = Team.create(name: team_data['TEAM_NAME'], city: team_data['TEAM_CITY'], division_id: division.id)
          team_data['PLAYER'].each do |player_data|
            player = Player.create(
              surname: player_data['SURNAME'],
              given_name: player_data['GIVEN_NAME'],
              position: player_data['POSITION'],
              games: player_data['GAMES'],
              games_started: player_data['GAMES_STARTED'],
              complete_games: player_data['COMPLETE_GAMES'],
              shut_outs: player_data['SHUT_OUTS'],
              era: player_data['ERA'],
              innings: player_data['INNINGS'],
              at_bats: player_data['AT_BATS'],
              runs: player_data['RUNS'],
              earned_runs: player_data['EARNED_RUNS'],
              hit_batter: player_data['HIT_BATTER'],
              hits: player_data['HITS'],
              wild_pitches: player_data['WILD_PITCHES'],
              balk: player_data['BALK'],
              walked_batter: player_data['WALKED_BATTER'],
              doubles: player_data['DOUBLES'],
              triples: player_data['TRIPLES'],
              home_runs: player_data['HOME_RUNS'],
              rbi: player_data['RBI'],
              steals: player_data['STEALS'],
              caught_stealing: player_data['CAUGHT_STEALING'],
              sacrifice_hits: player_data['SACRIFICE_HITS'],
              sacrifice_flies: player_data['SACRIFICE_FLIES'],
              errs: player_data['ERRORS'],
              pb: player_data['PB'],
              walks: player_data['WALKS'],
              struck_out: player_data['STRUCK_OUT'],
              hit_by_pitch: player_data['HIT_BY_PITCH'],
              team_id: team.id)
          end
        end
      end
    end
  end

end


# lass Player
#   # SURNAME
#   # GIVEN_NAME
#   # POSITION
#   # GAMES
#   # GAMES_STARTED
#   # AT_BATS
#   # RUNS
#   # HITS
#   # DOUBLES
#   # TRIPLES
#   # HOME_RUNS => hr
#   # RBI
#   # STEALS => sb
#   # CAUGHT_STEALING
#   # SACRIFICE_HITS
#   # SACRIFICE_FLIES
#   # ERRORS
#   # PB
#   # WALKS
#   # STRUCK_OUT
#   # HIT_BY_PITCH

#   attr_reader :surname, :given_name, :position, :games, :games_started, :at_bats, :runs, :hits,
#     :doubles, :triples, :hr, :rbi, :sb, :caught_stealing, :sacrifice_hits, :sacrifice_flies,
#     :errors, :pb, :walks, :struck_out, :hit_by_pitch
#   attr_reader :team

#   def initialize data, team
#     @surname = data['SURNAME']
#     @given_name = data['GIVEN_NAME']
#     @rbi = data['RBI'].to_i
#     @hr = data['HOME_RUNS'].to_i
#     @sb = data['STEALS'].to_i
#     @runs = data['RUNS'].to_i

#     @hits = data['HITS'].to_i
#     @at_bats = data['AT_BATS'].to_i

#     @team = team
#   end

#   def name
#     [given_name, surname].join(' ')
#   end

#   def avg
#     return 0 if hits.zero? || at_bats.zero?

#     '%.3f' % (hits.to_f / at_bats)
#   end
# end
