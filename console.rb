require_relative('models/sql_runner')
require_relative('models/team')
require_relative('models/match')
require_relative('models/player')
require_relative('models/league')
require('pry-byebug')

runner = SqlRunner.new({dbname: "dodgeball_league", host: "localhost"})

Match.delete(runner)
Player.delete(runner)
Team.delete(runner)

team1 = Team.new({"name" => "Globo Gym"}, runner)
t1 = team1.save()
team2 = Team.new({"name" => "Average Joes"}, runner)
t2 = team2.save()

# t1.update_name("Greens")

match1 = Match.new({"home_team_id" => t1.id, "away_team_id" => t2.id, "home_team_score" => 2, "away_team_score" => 3}, runner)
m1 = match1.save()
match2 = Match.new({"home_team_id" => t2.id, "away_team_id" => t1.id, "home_team_score" => 2, "away_team_score" => 0}, runner)
m2 = match2.save()

player1 = Player.new({"first_name" => "White", "last_name" => "Goodman", "team_id" => t1.id}, runner)
p1 = player1.save()
player2 = Player.new({"first_name" => "Pete", "last_name" => "LaFleur", "team_id" => t2.id}, runner)
p2 = player2.save()

league = League.new(runner)


binding.pry
nil