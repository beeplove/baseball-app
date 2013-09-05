require 'open-uri'


namespace :baseball do
  desc "TODO"
  task :load_1998 => :environment do
    xml = Nokogiri::XML(open('http://www.cafeconleche.org/examples/baseball/1998statistics.xml'))
    data = Hash.from_xml(xml.to_s)    

    # @name = data['DIVISION_NAME']
    # @teams = data['TEAM'].collect { |team| Team.new(team, self) }

    Season.destroy_all

    season_data = data['SEASON']
    season = Season.create(year: season_data['YEAR'])
    season_data['LEAGUE'].each do |league_data|
      league = League.create(name: league_data['LEAGUE_NAME'], season_id: season.id)
      league_data['DIVISION'].each do |division_data|
        division = Division.create(name: division_data['DIVISION_NAME'], league_id: league.id)
      end
    end
  end

end
