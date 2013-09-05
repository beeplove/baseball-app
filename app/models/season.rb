# require "rubygems"
# require "nokogiri"
require 'open-uri'

class Season
  attr_reader :year, :leagues

  @@season = nil

  def initialize data
    @year = data['YEAR']
    @leagues = data['LEAGUE'].collect { |league| League.new(league, self) }
  end

  class << self
    def load
      unless @@season
        xml = Nokogiri::XML(open('http://www.cafeconleche.org/examples/baseball/1998statistics.xml'))
        hash = Hash.from_xml(xml.to_s)

        @@season = Season.new(hash['SEASON'])
      end

      @@season
    end
  end
end