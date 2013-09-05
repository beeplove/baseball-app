class Team
  attr_reader :name, :city, :players, :division

  def initialize data, division
    @name = data['TEAM_NAME']
    @city = data['TEAM_CITY']
    @players = data['PLAYER'].collect { |player| Player.new(player, self) }
    @division = division
  end
end
