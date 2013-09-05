class League
  attr_reader :name, :divisions, :season

  def initialize data, season
    @name = data['LEAGUE_NAME']
    @divisions = data['DIVISION'].collect { |division| Division.new(division, self)}
    @season = season
  end
end