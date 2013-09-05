require 'open-uri'


namespace :baseball do
  desc "TODO"
  task :load_1998 => :environment do
    xml = Nokogiri::XML(open('http://www.cafeconleche.org/examples/baseball/1998statistics.xml'))
    data = Hash.from_xml(xml.to_s)    

    #     @year = data['YEAR']
    # @leagues = data['LEAGUE'].collect { |league| League.new(league, self) }

    #         @@season = Season.new(hash['SEASON'])

    season = data['SEASON']
    Season.create(year: season['YEAR'])
  end

end
