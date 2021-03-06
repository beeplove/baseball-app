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
                avg: player.avg,
                hr: player.home_runs,
                rbi: player.rbi,
                runs: player.runs,
                sb: player.steals,
                ops: player.ops
              }
            end
          end
        end
      end
    end

    result = {
      headers: [ 'NAME', 'AVG', 'HR', 'RBI', 'RUNS', 'SB', 'OPS'],
      data: data
    }

    respond_to do |format|
      format.json { render :json => result }
    end
  end
end
