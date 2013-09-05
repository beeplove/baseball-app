class DataController < ApplicationController
  def players
    data = []

    Season.where(year: 1998).each do |season|
      season.leagues.each do |league|
        league.divisions.each do |division|
          division.teams.each do |team|
            team.players.each do |player|
              data << {
                name: player.name,
                avg: player.avg
              }
            end
          end
        end
      end
    end

    result = {
      headers: [ 'Name', 'Avg' ],
      data: data
    }

    respond_to do |format|
      format.json { render :json => result }
    end
  end
end
