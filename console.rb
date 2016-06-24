require_relative('models/sql_runner')
require_relative('models/team')
require_relative('models/match')
require('pry-byebug')

runner = SqlRunner.new({dbname: "dodgeball_league", host: "localhost"})

team1 = Team.new({"name" => "Globo Gym"}, runner)
t1 = team1.save()
team2 = Team.new({"name" => "Average Joes"}, runner)
t2 = team2.save()

match1 = Match.new({"home_team_id" => team1.id, "away_team_id" => team2.id, "home_team_score" => 10, "away_team_score" => 20}, runner)






binding.pry
nil