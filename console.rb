require_relative('models/sql_runner')
require_relative('models/team')
require_relative('models/match')
require('pry_byebug')

runner = SqlRunner.new({dbname: "dodgeball_league", host: "localhost"})

team1 = Team.new({"name" => "Globo Gym"}, runner)
team2 = Team.new({"name" => "Average Joe's"}, runner)

match1 = Match.new({"home_team_id" => team1.id, "away_team_id" => team2.id, "home_team_score" => 10, "away_team_score" => 20}, runner)






binding.pry
nil