class Division
  attr_reader :name, :teams, :league


  def initialize data, league
    @name = data['DIVISION_NAME']
    @teams = data['TEAM'].collect { |team| Team.new(team, self) }
    @league = league
  end
end
