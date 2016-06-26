require_relative('team')
require_relative('match')
require_relative('sql_runner')
require('pry-byebug')

class League

  def initialize(runner)
    @teams = Team.all(runner)
    @matches = Match.all(runner)
    @runner = runner
  end

  def match_winner_by_id(match)
    return match.home_team_id if match.home_team_score > match.away_team_score
    return match.away_team_id if match.away_team_score > match.home_team_score

    sql = "SELECT home_team_id FROM matches WHERE home_team_score > away_team_score"

    sql = "SELECT name FROM teams INNER JOIN matches ON matches.home_team_id = teams.id WHERE matches.home_team_score > matches.away_team_score"

    sql "SELECT teams.name, matches.id FROM teams INNER JOIN matches ON matches.home_team_id = teams.id WHERE matches.home_team_score > matches.away_team_score"

  end

  def 
  end





end

binding.pry
nil


