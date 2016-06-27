# require_relative('sql_runner')
# require_relative('team')
# require_relative('match')

# class League

#   def initialize(options, runner)
#     @id = options["id"].to_i
#     @team_id = options["team_id"]
#     @number_of_wins = options["number_of_wins"]
#     @number_of_losees = options["number_of_losses"]
#     @runner = runner
#   end

# end



# require_relative('team')
# require_relative('match')
# require_relative('sql_runner')
# require('pry-byebug')

# class League

#   def initialize(runner)
#     @teams = Team.all(runner)
#     @matches = Match.all(runner)
#     @runner = runner
#   end

#   def match_winner_by_id(match)

    sql = "SELECT teams.id AS team_id, teams.name AS winning_team_name, matches.id AS match_id FROM teams INNER JOIN matches ON matches.home_team_id = teams.id WHERE matches.home_team_score > matches.away_team_score"

#   end




# end

# binding.pry
# nil


