class DataController < ApplicationController
  def players

    # AVG, HR, RBI, RUNS, SB, and OPS
    data = []
    Season.load.leagues.each do |league|
      league.divisions.each do |division|
        division.teams.each do |team|
          team.players.each do |player|
            data << { 
              name: player.name,
              rbi: player.rbi,
              hr: player.hr,
              sb: player.sb,
              runs: player.runs,
              avg: player.avg
            }
          end
        end
      end
    end

    result = {
      headers: [ 'Name', 'Avg', 'HR', 'RBI', 'SB', 'RUNS'],
      data: data
        # { name: 'Mohammad Khan',  avg: 10, hr: 100 },
        # { name: 'Rumana Hasan',   avg: 11, hr: 130 },
        # { name: 'Purba Khan',     avg: 13, hr: 200 },
        # { name: 'Prottoy Khan',   avg: 9,  hr: 105  }          
    }

    respond_to do |format|
      format.json { render :json => result }
    end
  end
end
